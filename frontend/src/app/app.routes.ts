import { Routes } from '@angular/router';
import { authGuard } from './core/guards/auth.guard';

export const routes: Routes = [
  {
    path: '',
    redirectTo: 'login',
    pathMatch: 'full'
  },
  {
    path: 'login',
    loadComponent: () => import('./features/login/login.component').then(m => m.LoginComponent)
  },
  {
    path: 'dashboard',
    canActivate: [authGuard],
    loadComponent: () => import('./features/dashboard/dashboard.component').then(m => m.DashboardComponent)
  },
  {
    path: 'books',
    canActivate: [authGuard],
    loadComponent: () => import('./features/books/book-list/book-list.component').then(m => m.BookListComponent)
  },
  {
    path: 'members',
    canActivate: [authGuard],
    data: { roles: ['ADMIN'] },
    loadComponent: () => import('./features/members/member-list/member-list.component').then(m => m.MemberListComponent)
  },
  {
    path: 'lending',
    canActivate: [authGuard],
    data: { roles: ['ADMIN'] },
    loadComponent: () => import('./features/lending/lending-list/lending-list.component').then(m => m.LendingListComponent)
  },
  {
    path: 'fines',
    canActivate: [authGuard],
    loadComponent: () => import('./features/fines/fine-list/fine-list.component').then(m => m.FineListComponent)
  },
  {
    path: 'recommendations',
    canActivate: [authGuard],
    data: { roles: ['STUDENT'] },
    loadComponent: () => import('./features/recommendations/recommendations.component').then(m => m.RecommendationsComponent)
  },
  {
    path: '**',
    redirectTo: 'books'
  }
];
