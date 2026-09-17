export type ReservationStatus = 'PENDING' | 'FULFILLED' | 'CANCELLED';

export interface Reservation {
  id: number;
  bookId: number;
  bookTitle: string;
  bookIsbn: string;
  memberId: number;
  memberName: string;
  memberEmail: string;
  reservationDate: string;
  status: ReservationStatus;
  fulfillmentDate?: string;
  createdAt: string;
}

export interface ReservationRequest {
  bookId: number;
  memberId: number;
}
