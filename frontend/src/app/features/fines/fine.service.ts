import { Injectable, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, map } from 'rxjs';
import { ApiResponse } from '../../shared/models/api-response.model';
import { Fine, PayFineRequest } from '../../shared/models/fine.model';

@Injectable({
  providedIn: 'root'
})
export class FineService {
  private http = inject(HttpClient);
  private apiUrl = 'http://localhost:8080/api/fines';

  getAllFines(): Observable<Fine[]> {
    return this.http.get<ApiResponse<Fine[]>>(this.apiUrl).pipe(map(res => res.data));
  }

  getUnpaidFines(): Observable<Fine[]> {
    return this.http.get<ApiResponse<Fine[]>>(`${this.apiUrl}/unpaid`).pipe(map(res => res.data));
  }

  getFinesByMember(memberId: number): Observable<Fine[]> {
    return this.http.get<ApiResponse<Fine[]>>(`${this.apiUrl}/member/${memberId}`).pipe(map(res => res.data));
  }

  payFine(fineId: number, request: PayFineRequest): Observable<Fine> {
    return this.http.post<ApiResponse<Fine>>(`${this.apiUrl}/${fineId}/pay`, request).pipe(map(res => res.data));
  }
}
