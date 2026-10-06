export interface Book {
  id?: number;
  isbn: string;
  title: string;
  author: string;
  category?: string;
  totalCopies: number;
  availableCopies?: number;
  description?: string;
  keywords?: string;
  publicationYear?: number;
  averageRating?: number;
  ratingsCount?: number;
  aisle?: string;
  shelf?: string;
  columnRack?: string;
  createdAt?: string;
  updatedAt?: string;
}

export interface BookRequest {
  isbn: string;
  title: string;
  author: string;
  category?: string;
  totalCopies: number;
  description?: string;
  keywords?: string;
  publicationYear?: number;
  averageRating?: number;
  aisle?: string;
  shelf?: string;
  columnRack?: string;
}
