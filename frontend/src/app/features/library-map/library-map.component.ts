import { Component, OnInit, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Router } from '@angular/router';
import { BookService } from '../books/book.service';
import { Book } from '../../shared/models/book.model';

export interface AisleInfo {
  number: number;
  name: string;
  department: string;
  zone: 'North Wing' | 'South Wing';
  shelves: string[];
  description: string;
  color: string;
  bookCount?: number;
}

@Component({
  selector: 'app-library-map',
  standalone: true,
  imports: [CommonModule, RouterModule],
  templateUrl: './library-map.component.html',
  styleUrls: ['./library-map.component.css']
})
export class LibraryMapComponent implements OnInit {
  private bookService = inject(BookService);
  private router = inject(Router);

  allBooks: Book[] = [];
  selectedAisle: AisleInfo | null = null;
  aisleBooks: Book[] = [];
  loading: boolean = false;

  aisles: AisleInfo[] = [
    {
      number: 1,
      name: 'Aisle 1 (CSE/IT)',
      department: 'Computer Science & Engineering / IT',
      zone: 'North Wing',
      shelves: ['Shelf A1', 'Shelf A2', 'Shelf B1', 'Shelf B2', 'Shelf C1', 'Shelf C2', 'Shelf D1', 'Shelf D2'],
      description: 'Algorithms, Data Structures, AI, Database Systems, Computer Networks, Operating Systems, Cloud Architecture',
      color: '#4A6B82'
    },
    {
      number: 2,
      name: 'Aisle 2 (ECE/EEE)',
      department: 'Electronics & Electrical Engineering',
      zone: 'North Wing',
      shelves: ['Shelf A1', 'Shelf A2', 'Shelf B1', 'Shelf B2', 'Shelf C1', 'Shelf C2'],
      description: 'Digital Signal Processing, Microelectronics, VLSI Systems, Control Systems, Power Electronics',
      color: '#5C7A68'
    },
    {
      number: 3,
      name: 'Aisle 3 (Mechanical)',
      department: 'Mechanical & Automation Engineering',
      zone: 'North Wing',
      shelves: ['Shelf A1', 'Shelf A2', 'Shelf B1', 'Shelf B2', 'Shelf C1', 'Shelf C2'],
      description: 'Thermodynamics, CAD/CAM, Mechanics of Materials, Heat Transfer, Robotics & Mechatronics',
      color: '#9C6F4A'
    },
    {
      number: 4,
      name: 'Aisle 4 (Civil)',
      department: 'Civil Engineering & Infrastructure',
      zone: 'North Wing',
      shelves: ['Shelf A1', 'Shelf A2', 'Shelf B1', 'Shelf B2'],
      description: 'Structural Analysis, Soil Mechanics, Fluid Mechanics, Transportation & Surveying',
      color: '#8A735E'
    },
    {
      number: 5,
      name: 'Aisle 5 (Math & Sciences)',
      department: 'Applied Mathematics & Physics',
      zone: 'South Wing',
      shelves: ['Shelf A1', 'Shelf A2', 'Shelf B1', 'Shelf B2'],
      description: 'Discrete Mathematics, Numerical Analysis, Linear Algebra, Probability & Applied Physics',
      color: '#655A8A'
    },
    {
      number: 6,
      name: 'Aisle 6 (Management)',
      department: 'Management Studies (MBA)',
      zone: 'South Wing',
      shelves: ['Shelf A1', 'Shelf A2', 'Shelf B1', 'Shelf B2'],
      description: 'Financial Management, Organizational Behavior, The Lean Startup, Marketing Strategy',
      color: '#8E5A73'
    },
    {
      number: 7,
      name: 'Aisle 7 (Literature & Fiction)',
      department: 'World Literature & Humanities',
      zone: 'South Wing',
      shelves: ['Shelf A1', 'Shelf A2', 'Shelf B1', 'Shelf B2'],
      description: 'Classic Fiction, 1984, To Kill a Mockingbird, The Great Gatsby, Pride and Prejudice, Sci-Fi',
      color: '#4B7A75'
    },
    {
      number: 8,
      name: 'Aisle 8 (Special Collections)',
      department: 'Research Theses & Rare Manuscripts',
      zone: 'South Wing',
      shelves: ['Shelf A1', 'Shelf A2'],
      description: 'University Dissertations, IEEE Conference Proceedings, Reference Encyclopedias & Handbooks',
      color: '#847E4B'
    }
  ];

  ngOnInit(): void {
    this.selectedAisle = this.aisles[0];
    this.loadBooks();
  }

  loadBooks(): void {
    this.loading = true;
    this.bookService.getBooks().subscribe({
      next: (books: Book[]) => {
        this.allBooks = books || [];
        // Compute count per aisle
        this.aisles.forEach(a => {
          a.bookCount = this.allBooks.filter(b => b.aisle && b.aisle.toLowerCase().includes(`aisle ${a.number}`)).length;
        });
        this.updateAisleBooks();
        this.loading = false;
      },
      error: () => {
        this.loading = false;
      }
    });
  }

  selectAisle(aisle: AisleInfo): void {
    this.selectedAisle = aisle;
    this.updateAisleBooks();
  }

  updateAisleBooks(): void {
    if (!this.selectedAisle) {
      this.aisleBooks = [];
      return;
    }
    const num = this.selectedAisle.number;
    this.aisleBooks = this.allBooks.filter(b => b.aisle && b.aisle.toLowerCase().includes(`aisle ${num}`));
  }

  viewInCatalog(bookTitle: string): void {
    this.router.navigate(['/books'], { queryParams: { q: bookTitle } });
  }
}
