import { Component, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { AuthService } from '../../core/services/auth.service';

@Component({
  selector: 'app-sidebar',
  standalone: true,
  imports: [CommonModule, RouterModule],
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.css']
})
export class SidebarComponent {
  authService = inject(AuthService);

  get navLinks() {
    if (this.authService.isAdmin()) {
      return [
        { path: '/dashboard', label: 'Dashboard', icon: '📊' },
        { path: '/books', label: 'Books Inventory', icon: '📚' },
        { path: '/members', label: 'Members Directory', icon: '👥' },
        { path: '/lending', label: 'Issue & Return', icon: '🔄' },
        { path: '/fines', label: 'Fines & Payments', icon: '💳' }
      ];
    } else {
      return [
        { path: '/dashboard', label: 'Student Dashboard', icon: '📊' },
        { path: '/books', label: 'Catalog & Shelf Locator', icon: '📚' },
        { path: '/fines', label: 'My Fines & Dues', icon: '💳' },
        { path: '/recommendations', label: 'AI Recommendations', icon: '💡' }
      ];
    }
  }
}
