import { Injectable, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, map } from 'rxjs';
import { ApiResponse } from '../../shared/models/api-response.model';
import { Transaction, IssueRequest } from '../../shared/models/transaction.model';

@Injectable({
  providedIn: 'root'
})
export class LendingService {
  private http = inject(HttpClient);
  private apiUrl = 'http://localhost:8080/api/transactions';

  getAllTransactions(): Observable<Transaction[]> {
    return this.http.get<ApiResponse<Transaction[]>>(this.apiUrl).pipe(map(res => res.data));
  }

  getActiveTransactions(): Observable<Transaction[]> {
    return this.http.get<ApiResponse<Transaction[]>>(`${this.apiUrl}/active`).pipe(map(res => res.data));
  }

  getOverdueTransactions(): Observable<Transaction[]> {
    return this.http.get<ApiResponse<Transaction[]>>(`${this.apiUrl}/overdue`).pipe(map(res => res.data));
  }

  getMemberTransactions(memberId: number): Observable<Transaction[]> {
    return this.http.get<ApiResponse<Transaction[]>>(`${this.apiUrl}/member/${memberId}`).pipe(map(res => res.data));
  }

  issueBook(request: IssueRequest): Observable<Transaction> {
    return this.http.post<ApiResponse<Transaction>>(`${this.apiUrl}/issue`, request).pipe(map(res => res.data));
  }

  returnBook(transactionId: number): Observable<Transaction> {
    return this.http.post<ApiResponse<Transaction>>(`${this.apiUrl}/${transactionId}/return`, {}).pipe(map(res => res.data));
  }
}
