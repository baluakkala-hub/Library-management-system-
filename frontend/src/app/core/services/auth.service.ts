import { Injectable, signal, inject } from '@angular/core';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { Observable, of, throwError } from 'rxjs';
import { map, catchError } from 'rxjs/operators';
import { User, UserRole } from '../models/user.model';

export interface AuthCredential {
  username: string;
  passwordHash: string;
  user: User;
}

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private http = inject(HttpClient);
  private router = inject(Router);

  private readonly AUTH_STORAGE_KEY = 'smart_lms_auth_user';
  private readonly TOKEN_STORAGE_KEY = 'smart_lms_jwt_token';
  private readonly API_BASE_URL = 'http://localhost:8080/api/auth';

  // Library Contact Information
  readonly libraryContact = {
    phone: '0987654654',
    email: 'LIBRARY@admin.com',
    adminName: 'Chief Librarian Desk',
    hours: 'Mon - Sat: 8:00 AM - 8:00 PM | Sun: 10:00 AM - 4:00 PM',
    location: 'Central Campus Library, Floors 1 & 2'
  };

  // Pre-configured fallback users for offline demo
  private readonly USERS_DB: AuthCredential[] = [
    {
      username: 'admin',
      passwordHash: 'admin123',
      user: {
        username: 'admin',
        name: 'Chief Librarian',
        role: 'ADMIN',
        email: 'LIBRARY@admin.com',
        avatar: 'ADM'
      }
    },
    {
      username: 'satish',
      passwordHash: 'student123',
      user: {
        username: 'satish',
        name: 'Satish Kumar',
        role: 'STUDENT',
        email: 'satish@sice.edu.in',
        memberId: 1,
        department: 'Computer Science & Engineering',
        avatar: 'SK'
      }
    },
    {
      username: 'balakrishna',
      passwordHash: 'student123',
      user: {
        username: 'balakrishna',
        name: 'Bala Krishna',
        role: 'STUDENT',
        email: 'balakrishna@sice.edu.in',
        memberId: 2,
        department: 'AI & Data Engineering',
        avatar: 'BK'
      }
    },
    {
      username: 'divya',
      passwordHash: 'student123',
      user: {
        username: 'divya',
        name: 'Divya Reddy',
        role: 'STUDENT',
        email: 'divyareddy@sice.edu.in',
        memberId: 3,
        department: 'Electronics & Communication',
        avatar: 'DR'
      }
    },
    {
      username: 'soumya',
      passwordHash: 'student123',
      user: {
        username: 'soumya',
        name: 'Soumya Naidu',
        role: 'STUDENT',
        email: 'soumya@sice.edu.in',
        memberId: 4,
        department: 'Civil Engineering',
        avatar: 'SN'
      }
    },
    {
      username: 'lokesh',
      passwordHash: 'student123',
      user: {
        username: 'lokesh',
        name: 'Lokesh Reddy',
        role: 'STUDENT',
        email: 'lokesh@sice.edu.in',
        memberId: 5,
        department: 'Mechanical Engineering',
        avatar: 'LR'
      }
    }
  ];

  currentUser = signal<User | null>(null);

  constructor() {
    this.restoreSession();
  }

  private restoreSession(): void {
    const saved = localStorage.getItem(this.AUTH_STORAGE_KEY);
    if (saved) {
      try {
        const user = JSON.parse(saved) as User;
        this.currentUser.set(user);
      } catch {
        this.currentUser.set(null);
      }
    } else {
      this.currentUser.set(null);
    }
  }

  login(usernameOrEmail: string, password: string): Observable<{ success: boolean; message: string }> {
    const payload = { usernameOrEmail: usernameOrEmail.trim(), password };

    return this.http.post<any>(`${this.API_BASE_URL}/login`, payload).pipe(
      map(res => {
        if (res.success && res.data) {
          const authData = res.data;
          const user: User = {
            username: authData.username,
            name: authData.name,
            role: (authData.role === 'ROLE_ADMIN' || authData.role === 'ADMIN') ? 'ADMIN' : 'STUDENT',
            email: authData.email,
            avatar: authData.avatar || (authData.role?.includes('ADMIN') ? 'ADM' : 'STU'),
            department: authData.department,
            memberId: authData.memberId
          };
          this.currentUser.set(user);
          localStorage.setItem(this.AUTH_STORAGE_KEY, JSON.stringify(user));
          if (authData.token) {
            localStorage.setItem(this.TOKEN_STORAGE_KEY, authData.token);
          }
          return { success: true, message: `Welcome back, ${user.name}!` };
        }
        return { success: false, message: res.message || 'Login failed' };
      }),
      catchError(err => {
        // Fallback for offline demo if backend is initializing
        const clean = usernameOrEmail.trim().toLowerCase();
        const cred = this.USERS_DB.find(u => u.username.toLowerCase() === clean || u.user.email.toLowerCase() === clean);
        if (cred && cred.passwordHash === password) {
          this.currentUser.set(cred.user);
          localStorage.setItem(this.AUTH_STORAGE_KEY, JSON.stringify(cred.user));
          return of({ success: true, message: `Welcome back, ${cred.user.name}!` });
        }
        const errorMsg = err.error?.message || 'Invalid username/email or password';
        return of({ success: false, message: errorMsg });
      })
    );
  }

  quickDemoLogin(username: string): void {
    const clean = username.toLowerCase();
    const cred = this.USERS_DB.find(u => u.username === clean);
    if (cred) {
      this.currentUser.set(cred.user);
      localStorage.setItem(this.AUTH_STORAGE_KEY, JSON.stringify(cred.user));
      this.router.navigate(['/books']);
    }
  }

  logout(): void {
    this.currentUser.set(null);
    localStorage.removeItem(this.AUTH_STORAGE_KEY);
    localStorage.removeItem(this.TOKEN_STORAGE_KEY);
    this.router.navigate(['/login']);
  }

  isLoggedIn(): boolean {
    return this.currentUser() !== null;
  }

  isAdmin(): boolean {
    const role = this.currentUser()?.role as string;
    return role === 'ADMIN' || role === 'ROLE_ADMIN';
  }

  isStudent(): boolean {
    const role = this.currentUser()?.role as string;
    return role === 'STUDENT' || role === 'ROLE_STUDENT';
  }

  getToken(): string | null {
    return localStorage.getItem(this.TOKEN_STORAGE_KEY);
  }

  getRole(): UserRole | 'GUEST' {
    return this.currentUser()?.role || 'GUEST';
  }

  getAvailableDemoUsers(): User[] {
    return this.USERS_DB.map(u => u.user);
  }
}
