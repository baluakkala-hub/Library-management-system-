import { Injectable, signal, inject } from '@angular/core';
import { Router } from '@angular/router';
import { User, UserRole } from '../models/user.model';

export interface AuthCredential {
  username: string;
  passwordHash: string; // plain text for demo: admin123 / student123
  user: User;
}

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private router = inject(Router);
  private readonly AUTH_STORAGE_KEY = 'smart_lms_auth_user';

  // Library Contact Information requested by user
  readonly libraryContact = {
    phone: '0987654654',
    email: 'LIBRARY@admin.com',
    adminName: 'Chief Librarian Desk',
    hours: 'Mon - Sat: 8:00 AM - 8:00 PM | Sun: 10:00 AM - 4:00 PM',
    location: 'Central Campus Library, Floors 1 & 2'
  };

  // Pre-configured University Accounts (Admin & Students across departments)
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

  login(username: string, password: string): { success: boolean; message: string } {
    const cleanUser = username?.trim().toLowerCase();
    const cred = this.USERS_DB.find(u => u.username.toLowerCase() === cleanUser);

    if (!cred) {
      return { success: false, message: 'Invalid username. Please check your credentials.' };
    }

    if (cred.passwordHash !== password) {
      return { success: false, message: 'Incorrect password. Try again.' };
    }

    this.currentUser.set(cred.user);
    localStorage.setItem(this.AUTH_STORAGE_KEY, JSON.stringify(cred.user));
    return { success: true, message: `Welcome back, ${cred.user.name}!` };
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
    this.router.navigate(['/login']);
  }

  isLoggedIn(): boolean {
    return this.currentUser() !== null;
  }

  isAdmin(): boolean {
    return this.currentUser()?.role === 'ADMIN';
  }

  isStudent(): boolean {
    return this.currentUser()?.role === 'STUDENT';
  }

  getRole(): UserRole | 'GUEST' {
    return this.currentUser()?.role || 'GUEST';
  }

  getAvailableDemoUsers(): User[] {
    return this.USERS_DB.map(u => u.user);
  }
}
