import { Component, OnInit, ChangeDetectorRef, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterModule, Router } from '@angular/router';
import { DashboardService } from './dashboard.service';
import { AuthService } from '../../core/services/auth.service';
import { LendingService } from '../lending/lending.service';
import { FineService } from '../fines/fine.service';
import { RecommendationService } from '../recommendations/recommendation.service';
import { DashboardStats } from '../../shared/models/dashboard.model';
import { Transaction } from '../../shared/models/transaction.model';
import { BookRecommendation } from '../../shared/models/recommendation.model';

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
  private lendingService = inject(LendingService);
  private fineService = inject(FineService);
  private recommendationService = inject(RecommendationService);
  private router = inject(Router);
  private cdr = inject(ChangeDetectorRef);

  stats: DashboardStats = {
    totalBooks: 100,
    totalAvailableBooks: 72,
    totalMembers: 40,
    activeMembers: 30,
    currentlyIssuedBooks: 28,
    overdueTransactions: 5,
    totalFinesAccrued: 650,
    totalUnpaidFines: 465,
    totalPaidFines: 185
  };
  loading: boolean = false;
  aiSearchQuery: string = '';
  showHelpModal: boolean = false;

  // Student-specific metrics
  studentActiveLoans: Transaction[] = [];
  studentFinesDue: number = 0;
  studentReturnedCount: number = 0;
  studentRecommendations: BookRecommendation[] = [];

  // Admin-specific live circulation
  recentCirculation: Transaction[] = [];

  // Quick actions feedback
  actionToast: string | null = null;

  // Example prompt suggestions for scholars
  exampleSuggestions: string[] = [
    'Find books about Machine Learning',
    'Where is DBMS?',
    'Recommend books for ECE',
    'Find Operating System textbooks'
  ];

  ngOnInit(): void {
    this.loadStats();
    if (this.authService.isStudent()) {
      this.loadStudentData();
    } else {
      this.loadAdminData();
    }
  }

  loadStudentData(): void {
    const user = this.authService.currentUser();
    const memberId = user?.memberId || 3; // Default to Divya Reddy (3) if not set

    // 1. Load active loans
    this.lendingService.getMemberTransactions(memberId).subscribe({
      next: (txs) => {
        const list = txs || [];
        this.studentActiveLoans = list.filter(t => t.status === 'ISSUED' || t.status === 'OVERDUE');
        this.studentReturnedCount = list.filter(t => t.status === 'RETURNED').length;
        this.cdr.detectChanges();
      },
      error: () => this.cdr.detectChanges()
    });

    // 2. Load personal dues
    this.fineService.getFinesByMember(memberId).subscribe({
      next: (fines) => {
        const list = fines || [];
        this.studentFinesDue = list
          .filter(f => f.status === 'UNPAID')
          .reduce((sum, f) => sum + (f.amount || 0), 0);
        this.cdr.detectChanges();
      },
      error: () => this.cdr.detectChanges()
    });

    // 3. Load personal AI suggestions
    this.recommendationService.getRecommendationsForMember(memberId, 4).subscribe({
      next: (recs) => {
        this.studentRecommendations = recs || [];
        this.cdr.detectChanges();
      },
      error: () => this.cdr.detectChanges()
    });
  }

  loadAdminData(): void {
    this.lendingService.getActiveTransactions().subscribe({
      next: (txs) => {
        this.recentCirculation = (txs || []).slice(0, 6);
        this.cdr.detectChanges();
      },
      error: () => this.cdr.detectChanges()
    });
  }

  renewStudentLoan(tx: Transaction): void {
    if (!tx.id) return;
    this.lendingService.renewLoan(tx.id).subscribe({
      next: (res) => {
        this.showToast(`✅ Successfully renewed "${tx.bookTitle}" by +7 days (New due date: ${res.dueDate})`);
        this.loadStudentData();
      },
      error: (err) => {
        const msg = err.error?.message || 'Unable to renew overdue loan. Please return or settle fines.';
        this.showToast(`⚠️ ${msg}`);
      }
    });
  }

  showToast(message: string): void {
    this.actionToast = message;
    this.cdr.detectChanges();
    setTimeout(() => {
      this.actionToast = null;
      this.cdr.detectChanges();
    }, 4500);
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
