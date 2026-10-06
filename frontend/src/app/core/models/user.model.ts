export type UserRole = 'ADMIN' | 'STUDENT';

export interface User {
  username: string;
  name: string;
  role: UserRole;
  email: string;
  memberId?: number;
  department?: string;
  avatar: string;
}
