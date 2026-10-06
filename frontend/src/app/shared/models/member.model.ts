export type MemberStatus = 'ACTIVE' | 'SUSPENDED' | 'INACTIVE';

export interface Member {
  id?: number;
  name: string;
  email: string;
  phone?: string;
  status: MemberStatus;
  membershipDate?: string;
  createdAt?: string;
  updatedAt?: string;
}

export interface MemberRequest {
  name: string;
  email: string;
  phone?: string;
  status?: MemberStatus;
}
