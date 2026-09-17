import { Component, OnInit, ChangeDetectorRef, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterModule, Router } from '@angular/router';
import { DashboardService } from './dashboard.service';
import { AuthService } from '../../core/services/auth.service';
import { DashboardStats } from '../../shared/models/dashboard.model';

interface BorrowedItem {
  title: string;
  author: string;
  dueDate: string;
  status: 'ON_TIME' | 'DUE_SOON' | 'OVERDUE';
  statusLabel: string;
  statusBadgeClass: string;
  dotColor: string;
}

interface CompactRecommendation {
  id: number;
  title: string;
  category: string;
  description: string;
  relevanceScore: number;
  location: string;
}

@Component({
  selector: 'app-dashboard',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterModule],
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {
  authService = inject(AuthService);
  private dashboardService = inject(DashboardService);
  private router = inject(Router);
  private cdr = inject(ChangeDetectorRef);

  stats: DashboardStats = {
    totalBooks: 248,
    totalAvailableBooks: 201,
    totalMembers: 10,
    activeMembers: 9,
    currentlyIssuedBooks: 2,
    overdueTransactions: 2,
    totalFinesAccrued: 0,
    totalUnpaidFines: 0,
    totalPaidFines: 0
  };
  loading: boolean = false;
  aiSearchQuery: string = '';
  showHelpModal: boolean = false;

  // Example prompt suggestions
  exampleSuggestions: string[] = [
    'Find books about Machine Learning',
    'Where is DBMS?',
    'Recommend books for ECE',
    'Find Neural Networks textbooks'
  ];

  // Compact Currently Borrowed list
  borrowedBooks: BorrowedItem[] = [
    {
      title: 'Data Structures and Algorithms in C++',
      author: 'Michael T. Goodrich',
      dueDate: 'Due Sep 12',
      status: 'ON_TIME',
      statusLabel: 'On Time',
      statusBadgeClass: 'badge-ontime',
      dotColor: 'var(--success)'
    },
    {
      title: 'Database System Concepts',
      author: 'Abraham Silberschatz',
      dueDate: 'Due Sep 8',
      status: 'DUE_SOON',
      statusLabel: 'Due Soon',
      statusBadgeClass: 'badge-duesoon',
      dotColor: 'var(--warning)'
    },
    {
      title: 'Computer Networks: A Systems Approach',
      author: 'Larry L. Peterson',
      dueDate: 'Due Sep 4',
      status: 'OVERDUE',
      statusLabel: 'Overdue',
      statusBadgeClass: 'badge-overdue',
      dotColor: 'var(--danger)'
    }
  ];

  // Horizontal AI Recommendations
  recommendedBooks: CompactRecommendation[] = [
    {
      id: 17,
      title: 'Microelectronic Circuits',
      category: 'Electronics & Communication',
      description: 'Foundational textbook on analog integrated circuit design, MOSFET modeling, and amplifiers.',
      relevanceScore: 96,
      location: 'Aisle 2 (ECE) • Shelf A1 • Rack 1'
    },
    {
      id: 18,
      title: 'Signals and Systems',
      category: 'Electronics & Communication',
      description: 'Comprehensive treatment of continuous and discrete-time signals, Fourier, and Z-transforms.',
      relevanceScore: 94,
      location: 'Aisle 2 (ECE) • Shelf A2 • Rack 1'
    },
    {
      id: 6,
      title: 'Deep Learning',
      category: 'Computer Science & AI',
      description: 'Mathematical foundations of deep feedforward networks, convolutional models, and attention.',
      relevanceScore: 91,
      location: 'Aisle 1 (CSE) • Shelf B2 • Rack 1'
    },
    {
      id: 50,
      title: 'Discrete Mathematics and Its Applications',
      category: 'Applied Mathematics',
      description: 'Core discrete mathematical structures, propositional logic, graph theory, and combinatorics.',
      relevanceScore: 89,
      location: 'Aisle 5 (Math) • Shelf B2 • Rack 1'
    }
  ];

  ngOnInit(): void {
    this.loadStats();
  }

  get greeting(): string {
    const hour = new Date().getHours();
    const prefix = hour < 12 ? 'Good morning' : (hour < 18 ? 'Good afternoon' : 'Good evening');
    const user = this.authService.currentUser();
    const name = user ? user.name.split(' ')[0] : 'Divya';
    return `${prefix}, ${name} 👋`;
  }

  get department(): string {
    const user = this.authService.currentUser();
    return user?.department || 'Electronics & Communication Engineering';
  }

  loadStats(): void {
    this.loading = true;
    this.dashboardService.getStats().subscribe({
      next: (data) => {
        if (data) {
          this.stats = data;
        }
        this.loading = false;
        this.cdr.detectChanges();
      },
      error: (err) => {
        console.warn('API error or server starting, using library stats:', err);
        this.loading = false;
        this.cdr.detectChanges();
      }
    });
  }

  onAiSearch(): void {
    if (this.aiSearchQuery && this.aiSearchQuery.trim().length > 0) {
      this.router.navigate(['/books'], { queryParams: { q: this.aiSearchQuery.trim() } });
    }
  }

  applySuggestion(suggestion: string): void {
    this.aiSearchQuery = suggestion;
    this.onAiSearch();
  }

  openContact(): void {
    this.showHelpModal = true;
  }

  closeContact(): void {
    this.showHelpModal = false;
  }

  viewBook(bookTitle: string): void {
    this.router.navigate(['/books'], { queryParams: { q: bookTitle } });
  }
}
