import { Injectable, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, map } from 'rxjs';
import { ApiResponse } from '../../shared/models/api-response.model';
import { DashboardStats } from '../../shared/models/dashboard.model';

@Injectable({
  providedIn: 'root'
})
export class DashboardService {
  private http = inject(HttpClient);
  private apiUrl = 'http://localhost:8080/api/dashboard/stats';

  getStats(): Observable<DashboardStats> {
    return this.http.get<ApiResponse<DashboardStats>>(this.apiUrl).pipe(map(res => res.data));
  }
}
