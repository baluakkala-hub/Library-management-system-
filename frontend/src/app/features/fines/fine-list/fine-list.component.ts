import { Component, OnInit, ChangeDetectorRef, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { FineService } from '../fine.service';
import { MemberService } from '../../members/member.service';
import { AuthService } from '../../../core/services/auth.service';
import { Fine, PaymentMethod } from '../../../shared/models/fine.model';
import { Member } from '../../../shared/models/member.model';

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
  private memberService = inject(MemberService);
  private cdr = inject(ChangeDetectorRef);

  fines: Fine[] = [];
  members: Member[] = [];
  filter: 'ALL' | 'UNPAID' = 'UNPAID';
  loading: boolean = false;

  // Pay Modal
  showPayModal: boolean = false;
  selectedFine?: Fine;
  selectedPaymentMethod: PaymentMethod = 'CASH';
  paying: boolean = false;

  // Admin Add / Assess Fine Modal
  showAddFineModal: boolean = false;
  selectedMemberId: number = 0;
  fineAmount: number = 50.00;
  fineReason: string = 'Late Return Penalty';
  customReasonNotes: string = '';
  submittingFine: boolean = false;
  addFineError: string = '';

  readonly PRESET_REASONS: string[] = [
    'Late Return Penalty',
    'Damaged Textbook - Torn Pages / Water Damage',
    'Lost Library Textbook Replacement Fee',
    'Lost Library Card / Barcode Re-issue',
    'Overdue Reservation Hold Violation',
    'General Library Conduct Penalty'
  ];

  ngOnInit(): void {
    this.loadFines();
    if (this.authService.isAdmin()) {
      this.loadMembers();
    }
  }

  loadMembers(): void {
    this.memberService.getMembers().subscribe({
      next: (data) => {
        this.members = data || [];
        if (this.members.length > 0 && !this.selectedMemberId) {
          this.selectedMemberId = this.members[0].id || 0;
        }
        this.cdr.detectChanges();
      },
      error: () => {}
    });
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

  // --- Add Fine Modal Handlers ---
  openAddFineModal(): void {
    if (this.members.length === 0) {
      this.loadMembers();
    }
    this.addFineError = '';
    this.fineAmount = 50.00;
    this.fineReason = 'Late Return Penalty';
    this.customReasonNotes = '';
    this.showAddFineModal = true;
    this.cdr.detectChanges();
  }

  closeAddFineModal(): void {
    this.showAddFineModal = false;
    this.addFineError = '';
    this.cdr.detectChanges();
  }

  submitAddFine(): void {
    if (!this.selectedMemberId || this.selectedMemberId === 0) {
      this.addFineError = 'Please select a student / member.';
      return;
    }

    if (!this.fineAmount || this.fineAmount < 1.00) {
      this.addFineError = 'Fine amount must be at least ₹1.00.';
      return;
    }

    const member = this.members.find(m => m.id === +this.selectedMemberId);
    const memberName = member ? member.name : 'Student';
    const finalReason = this.customReasonNotes?.trim() 
      ? `${this.fineReason} - ${this.customReasonNotes.trim()}`
      : this.fineReason;

    this.submittingFine = true;
    this.addFineError = '';
    this.cdr.detectChanges();

    this.fineService.createFine({
      memberId: +this.selectedMemberId,
      amount: +this.fineAmount,
      reason: finalReason
    }).subscribe({
      next: (created) => {
        this.submittingFine = false;
        this.closeAddFineModal();
        this.loadFines();
        alert(`✅ Fine of ₹${created.amount.toFixed(2)} successfully issued to ${memberName}.\n\n📧 An automated email notice has been dispatched to ${created.memberEmail || 'the cardholder'}.`);
      },
      error: (err) => {
        this.submittingFine = false;
        this.addFineError = err.error?.message || 'Failed to issue fine. Please check the inputs.';
        this.cdr.detectChanges();
      }
    });
  }

  // --- Pay Fine Modal Handlers ---
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
        alert(`✅ Fine of ₹${this.selectedFine!.amount.toFixed(2)} settled successfully.\n\n📧 Payment receipt email has been sent.`);
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
