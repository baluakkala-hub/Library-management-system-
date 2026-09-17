import { Component, Input, Output, EventEmitter, OnInit, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { MemberService } from '../member.service';
import { Member, MemberRequest, MemberStatus } from '../../../shared/models/member.model';

@Component({
  selector: 'app-member-form',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './member-form.component.html',
  styleUrls: ['./member-form.component.css']
})
export class MemberFormComponent implements OnInit {
  private memberService = inject(MemberService);

  @Input() member?: Member;
  @Output() save = new EventEmitter<void>();
  @Output() cancel = new EventEmitter<void>();

  formData: MemberRequest = {
    name: '',
    email: '',
    phone: '',
    status: 'ACTIVE'
  };

  isEditMode: boolean = false;
  saving: boolean = false;

  ngOnInit(): void {
    if (this.member && this.member.id) {
      this.isEditMode = true;
      this.formData = {
        name: this.member.name,
        email: this.member.email,
        phone: this.member.phone || '',
        status: this.member.status
      };
    }
  }

  onSubmit(): void {
    if (!this.formData.name || !this.formData.email) {
      alert('Please fill out Name and Email.');
      return;
    }

    this.saving = true;
    if (this.isEditMode && this.member?.id) {
      this.memberService.updateMember(this.member.id, this.formData).subscribe({
        next: () => {
          this.saving = false;
          this.save.emit();
        },
        error: () => {
          this.saving = false;
        }
      });
    } else {
      this.memberService.createMember(this.formData).subscribe({
        next: () => {
          this.saving = false;
          this.save.emit();
        },
        error: () => {
          this.saving = false;
        }
      });
    }
  }

  onCancel(): void {
    this.cancel.emit();
  }
}
