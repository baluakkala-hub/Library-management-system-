import { Component, Input, Output, EventEmitter, OnInit, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { BookService } from '../book.service';
import { Book, BookRequest } from '../../../shared/models/book.model';

@Component({
  selector: 'app-book-form',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './book-form.component.html',
  styleUrls: ['./book-form.component.css']
})
export class BookFormComponent implements OnInit {
  private bookService = inject(BookService);

  @Input() book?: Book;
  @Output() save = new EventEmitter<void>();
  @Output() cancel = new EventEmitter<void>();

  formData: BookRequest = {
    isbn: '',
    title: '',
    author: '',
    category: '',
    totalCopies: 1,
    aisle: 'Aisle 1',
    shelf: 'Shelf A1',
    columnRack: 'Rack 1'
  };

  isEditMode: boolean = false;
  saving: boolean = false;

  ngOnInit(): void {
    if (this.book && this.book.id) {
      this.isEditMode = true;
      this.formData = {
        isbn: this.book.isbn,
        title: this.book.title,
        author: this.book.author,
        category: this.book.category || '',
        totalCopies: this.book.totalCopies,
        aisle: this.book.aisle || 'Aisle 1',
        shelf: this.book.shelf || 'Shelf A1',
        columnRack: this.book.columnRack || 'Rack 1'
      };
    }
  }

  onSubmit(): void {
    if (!this.formData.isbn || !this.formData.title || !this.formData.author) {
      alert('Please fill out all required fields.');
      return;
    }

    this.saving = true;
    if (this.isEditMode && this.book?.id) {
      this.bookService.updateBook(this.book.id, this.formData).subscribe({
        next: () => {
          this.saving = false;
          this.save.emit();
        },
        error: () => {
          this.saving = false;
        }
      });
    } else {
      this.bookService.createBook(this.formData).subscribe({
        next: () => {
          this.saving = false;
          this.save.emit();
        },
        error: () => {
          this.saving = false;
        }
      });
    }
  }

  onCancel(): void {
    this.cancel.emit();
  }
}
