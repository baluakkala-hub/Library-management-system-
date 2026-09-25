import { Component, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router, ActivatedRoute } from '@angular/router';
import { AuthService } from '../../core/services/auth.service';
import { ThemeService } from '../../core/services/theme.service';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent {
  authService = inject(AuthService);
  themeService = inject(ThemeService);
  private router = inject(Router);
  private route = inject(ActivatedRoute);

  selectedRole: 'student' | 'admin' = 'student';

  username: string = '';
  password: string = '';
  error: string = '';
  loading: boolean = false;

  setRole(role: 'student' | 'admin'): void {
    if (this.selectedRole !== role) {
      this.selectedRole = role;
      this.error = '';
    }
  }

  onSubmit(): void {
    if (!this.username?.trim() || !this.password) {
      this.error = `Please enter both ${this.selectedRole === 'student' ? 'Student ID/username' : 'administrator username'} and password.`;
      return;
    }

    this.loading = true;
    this.error = '';

    this.authService.login(this.username.trim(), this.password).subscribe({
      next: (result) => {
        this.loading = false;
        if (result.success) {
          if (this.selectedRole === 'admin' && !this.authService.isAdmin()) {
            this.error = 'This account does not have Administrator privileges. Please switch to the Student Login tab.';
            return;
          }
          const returnUrl = this.route.snapshot.queryParams['returnUrl'] || (this.authService.isAdmin() ? '/dashboard' : '/books');
          this.router.navigateByUrl(returnUrl);
        } else {
          this.error = result.message;
        }
      },
      error: (err) => {
        this.loading = false;
        this.error = err.error?.message || 'Invalid username/email or password';
      }
    });
  }
}
