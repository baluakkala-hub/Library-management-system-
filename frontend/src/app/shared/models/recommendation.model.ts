export interface BookRecommendation {
  id: number;
  isbn: string;
  title: string;
  author: string;
  category: string;
  availableCopies: number;
  totalCopies: number;
  averageRating: number;
  similarityScore: number;
  matchPercentage: number;
  explanation: string;
  matchFactors: string[];
  aisle?: string;
  shelf?: string;
  columnRack?: string;
}
