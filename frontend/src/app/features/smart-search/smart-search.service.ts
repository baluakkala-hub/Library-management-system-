import { Injectable, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, map } from 'rxjs';
import { ApiResponse } from '../../shared/models/api-response.model';
import { SearchComparison, SemanticSearchResult } from '../../shared/models/search-comparison.model';

@Injectable({
  providedIn: 'root'
})
export class SmartSearchService {
  private http = inject(HttpClient);
  private apiUrl = 'http://localhost:8080/api/search';

  searchSemantic(query: string, limit: number = 10): Observable<SemanticSearchResult[]> {
    return this.http.get<ApiResponse<SemanticSearchResult[]>>(`${this.apiUrl}/semantic?query=${encodeURIComponent(query)}&limit=${limit}`)
      .pipe(map(res => res.data));
  }

  compareSearch(query: string): Observable<SearchComparison> {
    return this.http.get<ApiResponse<SearchComparison>>(`${this.apiUrl}/compare?query=${encodeURIComponent(query)}`)
      .pipe(map(res => res.data));
  }
}
