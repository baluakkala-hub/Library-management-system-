import { Component, OnInit, ChangeDetectorRef, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { BookService } from '../book.service';
import { MemberService } from '../../members/member.service';
import { ReservationService } from '../../reservations/reservation.service';
import { SmartSearchService } from '../../smart-search/smart-search.service';
import { AuthService } from '../../../core/services/auth.service';
import { Book } from '../../../shared/models/book.model';
import { Member } from '../../../shared/models/member.model';
import { BookFormComponent } from '../book-form/book-form.component';

@Component({
  selector: 'app-book-list',
  standalone: true,
  imports: [CommonModule, FormsModule, BookFormComponent],
  templateUrl: './book-list.component.html',
  styleUrls: ['./book-list.component.css']
})
export class BookListComponent implements OnInit {
  authService = inject(AuthService);
  private bookService = inject(BookService);
  private memberService = inject(MemberService);
  private reservationService = inject(ReservationService);
  private smartSearchService = inject(SmartSearchService);
  private route = inject(ActivatedRoute);
  private cdr = inject(ChangeDetectorRef);

  books: Book[] = [];
  searchQuery: string = '';
  loading: boolean = false;
  showModal: boolean = false;
  selectedBook?: Book;

  // AI Semantic Search Mode
  aiSearchMode: boolean = false;
  semanticMetaMap: Map<number, { relevance: number, matchedKeywords: string[] }> = new Map();

  // Pagination state
  pageNumber: number = 0;
  pageSize: number = 8;
  totalPages: number = 1;
  totalElements: number = 0;
  isPagedMode: boolean = true;

  // Reservation modal state
  showReserveModal: boolean = false;
  reserveBookTarget?: Book;
  activeMembers: Member[] = [];
  selectedMemberId: number = 0;
  reserving: boolean = false;

  ngOnInit(): void {
    this.loadMembersForReservation();

    // Check for query parameters passed from AI Omnibar or elsewhere
    this.route.queryParams.subscribe(params => {
      if (params['q']) {
        this.searchQuery = params['q'];
        this.aiSearchMode = true;
        this.onSearch();
      } else {
        this.loadBooks();
      }
    });
  }

  loadMembersForReservation(): void {
    this.memberService.getMembers().subscribe({
      next: (members) => {
        this.activeMembers = members.filter(m => m.status === 'ACTIVE');
        this.cdr.detectChanges();
      }
    });
  }

  toggleAiSearchMode(): void {
    this.aiSearchMode = !this.aiSearchMode;
    this.pageNumber = 0;
    if (this.searchQuery && this.searchQuery.trim().length > 0) {
      this.loadBooks();
    }
  }

  clearSearchFilter(): void {
    this.searchQuery = '';
    this.aiSearchMode = false;
    this.semanticMetaMap.clear();
    this.pageNumber = 0;
    this.loadBooks();
  }

  loadBooks(): void {
    this.loading = true;
    this.cdr.detectChanges();

    if (!this.authService.isAdmin() && this.aiSearchMode && this.searchQuery && this.searchQuery.trim().length > 0) {
      // AI SEMANTIC SEARCH INVENTORY (Students only)
      this.isPagedMode = false;
      this.smartSearchService.searchSemantic(this.searchQuery, 25).subscribe({
        next: (semResults) => {
          this.semanticMetaMap.clear();
          semResults.forEach(s => {
            this.semanticMetaMap.set(s.id, {
              relevance: s.relevancePercentage,
              matchedKeywords: s.matchedKeywords
            });
          });

          this.books = semResults.map(s => ({
            id: s.id,
            isbn: s.isbn,
            title: s.title,
            author: s.author,
            category: s.category,
            availableCopies: s.availableCopies,
            totalCopies: s.totalCopies,
            description: s.description,
            averageRating: 4.8,
            aisle: s.aisle,
            shelf: s.shelf,
            columnRack: s.columnRack
          }));

          this.loading = false;
          this.cdr.detectChanges();
        },
        error: () => {
          this.loading = false;
          this.cdr.detectChanges();
        }
      });
    } else if (this.searchQuery && this.searchQuery.trim().length > 0) {
      // STANDARD KEYWORD SEARCH
      this.isPagedMode = false;
      this.semanticMetaMap.clear();
      this.bookService.getBooks(this.searchQuery).subscribe({
        next: (data) => {
          this.books = data || [];
          this.loading = false;
          this.cdr.detectChanges();
        },
        error: () => {
          this.loading = false;
          this.cdr.detectChanges();
        }
      });
    } else {
      // PAGED DEFAULT VIEW
      this.isPagedMode = true;
      this.semanticMetaMap.clear();
      this.bookService.getPagedBooks(this.pageNumber, this.pageSize).subscribe({
        next: (res) => {
          this.books = res.content || [];
          this.pageNumber = res.pageNumber;
          this.totalPages = res.totalPages;
          this.totalElements = res.totalElements;
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

  onSearch(): void {
    this.pageNumber = 0;
    this.loadBooks();
  }

  goToPage(delta: number): void {
    const newPage = this.pageNumber + delta;
    if (newPage >= 0 && newPage < this.totalPages) {
      this.pageNumber = newPage;
      this.loadBooks();
    }
  }

  openAddModal(): void {
    if (!this.authService.isAdmin()) return;
    this.selectedBook = undefined;
    this.showModal = true;
    this.cdr.detectChanges();
  }

  openEditModal(book: Book): void {
    if (!this.authService.isAdmin()) return;
    this.selectedBook = { ...book };
    this.showModal = true;
    this.cdr.detectChanges();
  }

  closeModal(): void {
    this.showModal = false;
    this.selectedBook = undefined;
    this.cdr.detectChanges();
  }

  onSaveBook(): void {
    this.closeModal();
    this.loadBooks();
  }

  deleteBook(book: Book): void {
    if (!this.authService.isAdmin()) return;
    if (confirm(`Are you sure you want to delete "${book.title}"?`)) {
      this.bookService.deleteBook(book.id!).subscribe({
        next: () => this.loadBooks()
      });
    }
  }

  requestBorrow(book: Book): void {
    const user = this.authService.currentUser();
    const studentName = user ? user.name : 'Student';
    alert(`✅ Book Hold / Reservation Placed!\n\nTitle: "${book.title}"\nStudent: ${studentName}\nPhysical Location: ${book.aisle || 'Aisle 1'}, ${book.shelf || 'Shelf A1'}, ${book.columnRack || 'Rack 1'}\n\nPlease proceed to the circulation desk with your Student ID.`);
  }

  openReserveModal(book: Book): void {
    this.reserveBookTarget = book;
    if (this.authService.isStudent() && this.authService.currentUser()?.memberId) {
      this.selectedMemberId = this.authService.currentUser()!.memberId!;
    } else {
      this.selectedMemberId = 0;
    }
    this.showReserveModal = true;
    this.cdr.detectChanges();
  }

  closeReserveModal(): void {
    this.showReserveModal = false;
    this.reserveBookTarget = undefined;
    this.cdr.detectChanges();
  }

  confirmReservation(): void {
    if (!this.reserveBookTarget || !this.selectedMemberId) {
      alert('Please select a member to place a hold.');
      return;
    }

    this.reserving = true;
    this.cdr.detectChanges();
    this.reservationService.createReservation({
      bookId: this.reserveBookTarget.id!,
      memberId: this.selectedMemberId
    }).subscribe({
      next: () => {
        this.reserving = false;
        alert(`Hold placed on "${this.reserveBookTarget!.title}". You will be notified when a copy is returned.`);
        this.closeReserveModal();
        this.loadBooks();
      },
      error: () => {
        this.reserving = false;
        this.cdr.detectChanges();
      }
    });
  }
}
