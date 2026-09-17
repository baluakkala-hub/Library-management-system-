import { Injectable, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, map } from 'rxjs';
import { ApiResponse } from '../../shared/models/api-response.model';
import { Member, MemberRequest } from '../../shared/models/member.model';

@Injectable({
  providedIn: 'root'
})
export class MemberService {
  private http = inject(HttpClient);
  private apiUrl = 'http://localhost:8080/api/members';

  getMembers(search?: string): Observable<Member[]> {
    const url = search ? `${this.apiUrl}?search=${encodeURIComponent(search)}` : this.apiUrl;
    return this.http.get<ApiResponse<Member[]>>(url).pipe(map(res => res.data));
  }

  getMemberById(id: number): Observable<Member> {
    return this.http.get<ApiResponse<Member>>(`${this.apiUrl}/${id}`).pipe(map(res => res.data));
  }

  createMember(request: MemberRequest): Observable<Member> {
    return this.http.post<ApiResponse<Member>>(this.apiUrl, request).pipe(map(res => res.data));
  }

  updateMember(id: number, request: MemberRequest): Observable<Member> {
    return this.http.put<ApiResponse<Member>>(`${this.apiUrl}/${id}`, request).pipe(map(res => res.data));
  }

  deleteMember(id: number): Observable<void> {
    return this.http.delete<ApiResponse<void>>(`${this.apiUrl}/${id}`).pipe(map(() => undefined));
  }
}
