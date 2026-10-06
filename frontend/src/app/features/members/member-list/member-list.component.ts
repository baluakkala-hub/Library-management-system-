import { Component, OnInit, ChangeDetectorRef, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { MemberService } from '../member.service';
import { LendingService } from '../../lending/lending.service';
import { FineService } from '../../fines/fine.service';
import { Member } from '../../../shared/models/member.model';
import { Transaction } from '../../../shared/models/transaction.model';
import { Fine } from '../../../shared/models/fine.model';
import { MemberFormComponent } from '../member-form/member-form.component';

@Component({
  selector: 'app-member-list',
  standalone: true,
  imports: [CommonModule, FormsModule, MemberFormComponent],
  templateUrl: './member-list.component.html',
  styleUrls: ['./member-list.component.css']
})
export class MemberListComponent implements OnInit {
  private memberService = inject(MemberService);
  private lendingService = inject(LendingService);
  private fineService = inject(FineService);
  private cdr = inject(ChangeDetectorRef);

  members: Member[] = [];
  searchQuery: string = '';
  loading: boolean = false;
  showModal: boolean = false;
  selectedMember?: Member;

  // History modal
  showHistoryModal: boolean = false;
  historyMember?: Member;
  memberLoans: Transaction[] = [];
  memberFines: Fine[] = [];
  loadingHistory: boolean = false;

  // Digital ID Card modal
  showIdCardModal: boolean = false;
  idCardMember?: Member;
  activeLoanCount: number = 0;

  ngOnInit(): void {
    this.loadMembers();
  }

  loadMembers(): void {
    this.loading = true;
    this.memberService.getMembers(this.searchQuery).subscribe({
      next: (data) => {
        this.members = data || [];
        this.loading = false;
        this.cdr.detectChanges();
      },
      error: () => {
        this.loading = false;
        this.cdr.detectChanges();
      }
    });
  }

  onSearch(): void {
    this.loadMembers();
  }

  openAddModal(): void {
    this.selectedMember = undefined;
    this.showModal = true;
    this.cdr.detectChanges();
  }

  openEditModal(member: Member): void {
    this.selectedMember = { ...member };
    this.showModal = true;
    this.cdr.detectChanges();
  }

  closeModal(): void {
    this.showModal = false;
    this.selectedMember = undefined;
    this.cdr.detectChanges();
  }

  onSaveMember(): void {
    this.closeModal();
    this.loadMembers();
  }

  deleteMember(member: Member): void {
    if (confirm(`Are you sure you want to delete member "${member.name}"?`)) {
      this.memberService.deleteMember(member.id!).subscribe({
        next: () => this.loadMembers()
      });
    }
  }

  openHistoryModal(member: Member): void {
    this.historyMember = member;
    this.showHistoryModal = true;
    this.loadingHistory = true;
    this.cdr.detectChanges();

    this.lendingService.getMemberTransactions(member.id!).subscribe({
      next: (loans) => {
        this.memberLoans = loans || [];
        this.fineService.getFinesByMember(member.id!).subscribe({
          next: (fines) => {
            this.memberFines = fines || [];
            this.loadingHistory = false;
            this.cdr.detectChanges();
          },
          error: () => {
            this.loadingHistory = false;
            this.cdr.detectChanges();
          }
        });
      },
      error: () => {
        this.loadingHistory = false;
        this.cdr.detectChanges();
      }
    });
  }

  closeHistoryModal(): void {
    this.showHistoryModal = false;
    this.historyMember = undefined;
    this.memberLoans = [];
    this.memberFines = [];
    this.cdr.detectChanges();
  }

  toggleMemberStatus(member: Member): void {
    const isActivating = member.status !== 'ACTIVE';
    const actionName = isActivating ? 'Reactivate student ID and restore portal login for' : 'Deactivate student ID and suspend portal login for';
    if (confirm(`${actionName} "${member.name}"?`)) {
      this.memberService.toggleMemberStatus(member.id!).subscribe({
        next: (updated) => {
          member.status = updated.status;
          alert(`✅ Student ID for ${member.name} is now ${updated.status}.`);
          this.cdr.detectChanges();
        },
        error: (err) => {
          alert(`Failed to update status: ${err.error?.message || err.message}`);
        }
      });
    }
  }

  openIdCardModal(member: Member): void {
    this.idCardMember = member;
    this.showIdCardModal = true;
    this.activeLoanCount = 0;
    this.lendingService.getMemberTransactions(member.id!).subscribe({
      next: (loans) => {
        this.activeLoanCount = (loans || []).filter(l => l.status === 'ISSUED').length;
        this.cdr.detectChanges();
      },
      error: () => {
        this.cdr.detectChanges();
      }
    });
    this.cdr.detectChanges();
  }

  closeIdCardModal(): void {
    this.showIdCardModal = false;
    this.idCardMember = undefined;
    this.cdr.detectChanges();
  }

  getMonogram(name: string): string {
    if (!name) return 'S';
    const parts = name.trim().split(/\s+/);
    if (parts.length >= 2) {
      return (parts[0][0] + parts[1][0]).toUpperCase();
    }
    return name.slice(0, 2).toUpperCase();
  }

  printIdCard(): void {
    window.print();
  }
}
