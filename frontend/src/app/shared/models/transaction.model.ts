export type TransactionStatus = 'ISSUED' | 'RETURNED' | 'OVERDUE';

export interface Transaction {
  id: number;
  bookId: number;
  bookTitle: string;
  bookIsbn: string;
  memberId: number;
  memberName: string;
  memberEmail: string;
  issueDate: string;
  dueDate: string;
  returnDate?: string;
  status: TransactionStatus;
  fineAmount: number;
  createdAt: string;
}

export interface IssueRequest {
  bookId: number;
  memberId: number;
  loanDays?: number;
}
