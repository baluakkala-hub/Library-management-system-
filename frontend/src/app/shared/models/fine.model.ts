export type FineStatus = 'UNPAID' | 'PAID' | 'WAIVED';
export type PaymentMethod = 'CASH' | 'CARD' | 'UPI' | 'STUDENT_ACCOUNT';

export interface Fine {
  id: number;
  transactionId: number;
  bookTitle?: string;
  bookIsbn?: string;
  memberId: number;
  memberName: string;
  memberEmail: string;
  amount: number;
  reason?: string;
  status: FineStatus;
  paymentDate?: string;
  paymentMethod?: PaymentMethod;
  createdAt: string;
  updatedAt?: string;
}

export interface PayFineRequest {
  paymentMethod: PaymentMethod;
}

export interface CreateFineRequest {
  memberId: number;
  amount: number;
  reason: string;
  transactionId?: number;
}
