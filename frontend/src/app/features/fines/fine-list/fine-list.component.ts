import { Component, OnInit, ChangeDetectorRef, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { FineService } from '../fine.service';
import { AuthService } from '../../../core/services/auth.service';
import { Fine, PaymentMethod } from '../../../shared/models/fine.model';

@Component({
  selector: 'app-fine-list',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './fine-list.component.html',
  styleUrls: ['./fine-list.component.css']
})
export class FineListComponent implements OnInit {
  authService = inject(AuthService);
  private fineService = inject(FineService);
  private cdr = inject(ChangeDetectorRef);

  fines: Fine[] = [];
  filter: 'ALL' | 'UNPAID' = 'UNPAID';
  loading: boolean = false;
  showPayModal: boolean = false;
  selectedFine?: Fine;
  selectedPaymentMethod: PaymentMethod = 'CASH';
  paying: boolean = false;

  ngOnInit(): void {
    this.loadFines();
  }

  loadFines(): void {
    this.loading = true;
    const obs$ = this.filter === 'UNPAID' 
      ? this.fineService.getUnpaidFines() 
      : this.fineService.getAllFines();

    obs$.subscribe({
      next: (data) => {
        let records = data || [];
        const user = this.authService.currentUser();
        if (this.authService.isStudent() && user) {
          records = records.filter(f => 
            (user.email && f.memberEmail && f.memberEmail.toLowerCase() === user.email.toLowerCase()) ||
            (user.name && f.memberName && f.memberName.toLowerCase().includes(user.name.toLowerCase())) ||
            (user.memberId && f.memberId === user.memberId)
          );
        }
        this.fines = records;
        this.loading = false;
        this.cdr.detectChanges();
      },
      error: () => {
        this.loading = false;
        this.cdr.detectChanges();
      }
    });
  }

  setFilter(filter: 'ALL' | 'UNPAID'): void {
    this.filter = filter;
    this.loadFines();
  }

  openPayModal(fine: Fine): void {
    this.selectedFine = fine;
    this.selectedPaymentMethod = 'CASH';
    this.showPayModal = true;
    this.cdr.detectChanges();
  }

  closePayModal(): void {
    this.showPayModal = false;
    this.selectedFine = undefined;
    this.cdr.detectChanges();
  }

  confirmPayment(): void {
    if (!this.selectedFine) return;

    this.paying = true;
    this.cdr.detectChanges();
    this.fineService.payFine(this.selectedFine.id, { paymentMethod: this.selectedPaymentMethod }).subscribe({
      next: () => {
        this.paying = false;
        alert('Fine of $' + this.selectedFine!.amount.toFixed(2) + ' settled successfully.');
        this.closePayModal();
        this.loadFines();
      },
      error: () => {
        this.paying = false;
        this.cdr.detectChanges();
      }
    });
  }
}
