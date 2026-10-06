import { Injectable, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, map } from 'rxjs';
import { ApiResponse } from '../../shared/models/api-response.model';
import { Reservation, ReservationRequest } from '../../shared/models/reservation.model';

@Injectable({
  providedIn: 'root'
})
export class ReservationService {
  private http = inject(HttpClient);
  private apiUrl = 'http://localhost:8080/api/reservations';

  getAllReservations(): Observable<Reservation[]> {
    return this.http.get<ApiResponse<Reservation[]>>(this.apiUrl).pipe(map(res => res.data));
  }

  getPendingReservations(): Observable<Reservation[]> {
    return this.http.get<ApiResponse<Reservation[]>>(`${this.apiUrl}/pending`).pipe(map(res => res.data));
  }

  getReservationsByMember(memberId: number): Observable<Reservation[]> {
    return this.http.get<ApiResponse<Reservation[]>>(`${this.apiUrl}/member/${memberId}`).pipe(map(res => res.data));
  }

  createReservation(request: ReservationRequest): Observable<Reservation> {
    return this.http.post<ApiResponse<Reservation>>(this.apiUrl, request).pipe(map(res => res.data));
  }

  cancelReservation(id: number): Observable<Reservation> {
    return this.http.post<ApiResponse<Reservation>>(`${this.apiUrl}/${id}/cancel`, {}).pipe(map(res => res.data));
  }
}
