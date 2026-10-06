import { Injectable, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, map } from 'rxjs';
import { ApiResponse } from '../../shared/models/api-response.model';
import { BookRecommendation } from '../../shared/models/recommendation.model';

@Injectable({
  providedIn: 'root'
})
export class RecommendationService {
  private http = inject(HttpClient);
  private apiUrl = 'http://localhost:8080/api/recommendations';

  getRecommendationsForMember(memberId: number, limit: number = 6): Observable<BookRecommendation[]> {
    return this.http.get<ApiResponse<BookRecommendation[]>>(`${this.apiUrl}/member/${memberId}?limit=${limit}`)
      .pipe(map(res => res.data));
  }

  getSimilarBooks(bookId: number, limit: number = 4): Observable<BookRecommendation[]> {
    return this.http.get<ApiResponse<BookRecommendation[]>>(`${this.apiUrl}/book/${bookId}/similar?limit=${limit}`)
      .pipe(map(res => res.data));
  }

  getColdStartRecommendations(limit: number = 6): Observable<BookRecommendation[]> {
    return this.http.get<ApiResponse<BookRecommendation[]>>(`${this.apiUrl}/cold-start?limit=${limit}`)
      .pipe(map(res => res.data));
  }
}
