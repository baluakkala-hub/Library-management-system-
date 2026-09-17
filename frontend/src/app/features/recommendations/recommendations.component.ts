import { Component, OnInit, ChangeDetectorRef, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RecommendationService } from './recommendation.service';
import { MemberService } from '../members/member.service';
import { AuthService } from '../../core/services/auth.service';
import { BookRecommendation } from '../../shared/models/recommendation.model';
import { Member } from '../../shared/models/member.model';

@Component({
  selector: 'app-recommendations',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './recommendations.component.html',
  styleUrls: ['./recommendations.component.css']
})
export class RecommendationsComponent implements OnInit {
  authService = inject(AuthService);
  private recommendationService = inject(RecommendationService);
  private memberService = inject(MemberService);
  private cdr = inject(ChangeDetectorRef);

  members: Member[] = [];
  selectedMemberId: number = 1;
  selectedMemberName: string = 'Satish';
  recommendations: BookRecommendation[] = [];
  loading: boolean = false;

  // Similar books modal
  showSimilarModal: boolean = false;
  targetBookTitle: string = '';
  similarBooks: BookRecommendation[] = [];
  loadingSimilar: boolean = false;

  ngOnInit(): void {
    this.loadMembers();
  }

  loadMembers(): void {
    this.memberService.getMembers().subscribe({
      next: (data) => {
        this.members = data || [];
        const user = this.authService.currentUser();
        if (this.authService.isStudent() && user?.memberId) {
          const matched = this.members.find(m => m.id === user.memberId);
          if (matched) {
            this.selectedMemberId = matched.id!;
            this.selectedMemberName = matched.name;
          } else if (this.members.length > 0) {
            this.selectedMemberId = this.members[0].id!;
            this.selectedMemberName = this.members[0].name;
          }
        } else if (this.members.length > 0) {
          this.selectedMemberId = this.members[0].id!;
          this.selectedMemberName = this.members[0].name;
        }
        this.loadRecommendations();
        this.cdr.detectChanges();
      },
      error: () => {
        this.cdr.detectChanges();
      }
    });
  }

  onMemberChange(): void {
    const m = this.members.find(x => x.id === Number(this.selectedMemberId));
    if (m) {
      this.selectedMemberName = m.name;
    }
    this.loadRecommendations();
  }

  loadRecommendations(): void {
    if (!this.selectedMemberId) return;

    this.loading = true;
    this.cdr.detectChanges();
    this.recommendationService.getRecommendationsForMember(this.selectedMemberId, 6).subscribe({
      next: (data) => {
        this.recommendations = data || [];
        this.loading = false;
        this.cdr.detectChanges();
      },
      error: () => {
        this.loading = false;
        this.cdr.detectChanges();
      }
    });
  }

  openSimilarModal(book: BookRecommendation): void {
    this.targetBookTitle = book.title;
    this.showSimilarModal = true;
    this.loadingSimilar = true;
    this.cdr.detectChanges();

    this.recommendationService.getSimilarBooks(book.id, 4).subscribe({
      next: (data) => {
        this.similarBooks = data || [];
        this.loadingSimilar = false;
        this.cdr.detectChanges();
      },
      error: () => {
        this.loadingSimilar = false;
        this.cdr.detectChanges();
      }
    });
  }

  closeSimilarModal(): void {
    this.showSimilarModal = false;
    this.similarBooks = [];
    this.cdr.detectChanges();
  }
}
