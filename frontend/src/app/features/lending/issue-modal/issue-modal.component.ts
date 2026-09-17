import { Component, OnInit, Output, EventEmitter, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { LendingService } from '../lending.service';
import { BookService } from '../../books/book.service';
import { MemberService } from '../../members/member.service';
import { Book } from '../../../shared/models/book.model';
import { Member } from '../../../shared/models/member.model';
import { IssueRequest } from '../../../shared/models/transaction.model';

@Component({
  selector: 'app-issue-modal',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './issue-modal.component.html',
  styleUrls: ['./issue-modal.component.css']
})
export class IssueModalComponent implements OnInit {
  private lendingService = inject(LendingService);
  private bookService = inject(BookService);
  private memberService = inject(MemberService);

  @Output() issued = new EventEmitter<void>();
  @Output() cancel = new EventEmitter<void>();

  books: Book[] = [];
  members: Member[] = [];

  formData: IssueRequest = {
    bookId: 0,
    memberId: 0,
    loanDays: 14
  };

  issuing: boolean = false;

  ngOnInit(): void {
    this.bookService.getBooks().subscribe(data => {
      this.books = data.filter(b => (b.availableCopies || 0) > 0);
    });

    this.memberService.getMembers().subscribe(data => {
      this.members = data.filter(m => m.status === 'ACTIVE');
    });
  }

  onSubmit(): void {
    if (!this.formData.bookId || !this.formData.memberId) {
      alert('Please select both a Book and a Member.');
      return;
    }

    this.issuing = true;
    this.lendingService.issueBook(this.formData).subscribe({
      next: () => {
        this.issuing = false;
        this.issued.emit();
      },
      error: () => {
        this.issuing = false;
      }
    });
  }

  onCancel(): void {
    this.cancel.emit();
  }
}
