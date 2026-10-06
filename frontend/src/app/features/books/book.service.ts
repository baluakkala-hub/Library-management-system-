import { Injectable, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, map } from 'rxjs';
import { ApiResponse } from '../../shared/models/api-response.model';
import { Book, BookRequest } from '../../shared/models/book.model';

@Injectable({
  providedIn: 'root'
})
export class BookService {
  private http = inject(HttpClient);
  private apiUrl = 'http://localhost:8080/api/books';

  getBooks(search?: string): Observable<Book[]> {
    const url = search ? `${this.apiUrl}?search=${encodeURIComponent(search)}` : this.apiUrl;
    return this.http.get<ApiResponse<Book[]>>(url).pipe(map(res => res.data));
  }

  getPagedBooks(page: number = 0, size: number = 5): Observable<any> {
    return this.http.get<ApiResponse<any>>(`${this.apiUrl}/paged?page=${page}&size=${size}`).pipe(map(res => res.data));
  }

  getBookById(id: number): Observable<Book> {
    return this.http.get<ApiResponse<Book>>(`${this.apiUrl}/${id}`).pipe(map(res => res.data));
  }

  createBook(request: BookRequest): Observable<Book> {
    return this.http.post<ApiResponse<Book>>(this.apiUrl, request).pipe(map(res => res.data));
  }

  updateBook(id: number, request: BookRequest): Observable<Book> {
    return this.http.put<ApiResponse<Book>>(`${this.apiUrl}/${id}`, request).pipe(map(res => res.data));
  }

  deleteBook(id: number): Observable<void> {
    return this.http.delete<ApiResponse<void>>(`${this.apiUrl}/${id}`).pipe(map(() => undefined));
  }
}
