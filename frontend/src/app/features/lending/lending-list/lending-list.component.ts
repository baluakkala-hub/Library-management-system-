import { Component, OnInit, ChangeDetectorRef, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { LendingService } from '../lending.service';
import { ReservationService } from '../../reservations/reservation.service';
import { Transaction } from '../../../shared/models/transaction.model';
import { Reservation } from '../../../shared/models/reservation.model';
import { IssueModalComponent } from '../issue-modal/issue-modal.component';

@Component({
  selector: 'app-lending-list',
  standalone: true,
  imports: [CommonModule, FormsModule, IssueModalComponent],
  templateUrl: './lending-list.component.html',
  styleUrls: ['./lending-list.component.css']
})
export class LendingListComponent implements OnInit {
  private lendingService = inject(LendingService);
  private reservationService = inject(ReservationService);
  private cdr = inject(ChangeDetectorRef);

  transactions: Transaction[] = [];
  reservations: Reservation[] = [];
  filter: 'ALL' | 'ACTIVE' | 'OVERDUE' | 'RESERVATIONS' = 'ACTIVE';
  loading: boolean = false;
  showIssueModal: boolean = false;

  ngOnInit(): void {
    this.loadData();
  }

  loadData(): void {
    this.loading = true;
    if (this.filter === 'RESERVATIONS') {
      this.reservationService.getAllReservations().subscribe({
        next: (data) => {
          this.reservations = data || [];
          this.loading = false;
          this.cdr.detectChanges();
        },
        error: () => {
          this.loading = false;
          this.cdr.detectChanges();
        }
      });
    } else {
      let obs$;
      if (this.filter === 'ACTIVE') {
        obs$ = this.lendingService.getActiveTransactions();
      } else if (this.filter === 'OVERDUE') {
        obs$ = this.lendingService.getOverdueTransactions();
      } else {
        obs$ = this.lendingService.getAllTransactions();
      }

      obs$.subscribe({
        next: (data) => {
          this.transactions = data || [];
          this.loading = false;
          this.cdr.detectChanges();
        },
        error: () => {
          this.loading = false;
          this.cdr.detectChanges();
        }
      });
    }
  }

  setFilter(filter: 'ALL' | 'ACTIVE' | 'OVERDUE' | 'RESERVATIONS'): void {
    this.filter = filter;
    this.loadData();
  }

  openIssueModal(): void {
    this.showIssueModal = true;
    this.cdr.detectChanges();
  }

  closeIssueModal(): void {
    this.showIssueModal = false;
    this.cdr.detectChanges();
  }

  onBookIssued(): void {
    this.closeIssueModal();
    this.loadData();
  }

  exportCsv(): void {
    window.open('http://localhost:8080/api/transactions/export/csv', '_blank');
  }

  returnBook(transaction: Transaction): void {
    if (confirm(`Process return of "${transaction.bookTitle}" borrowed by ${transaction.memberName}?`)) {
      this.lendingService.returnBook(transaction.id).subscribe({
        next: (updated) => {
          if (updated.fineAmount > 0) {
            alert(`Book returned. An overdue fine of $${updated.fineAmount.toFixed(2)} has been recorded.`);
          } else {
            alert('Book returned on time with $0 fine.');
          }
          this.loadData();
        }
      });
    }
  }

  cancelReservation(reservation: Reservation): void {
    if (confirm(`Cancel reservation for "${reservation.bookTitle}" held by ${reservation.memberName}?`)) {
      this.reservationService.cancelReservation(reservation.id).subscribe({
        next: () => {
          alert('Reservation hold cancelled.');
          this.loadData();
        }
      });
    }
  }
}
