import { Book } from './book.model';

export interface SemanticSearchResult {
  id: number;
  isbn: string;
  title: string;
  author: string;
  category: string;
  availableCopies: number;
  totalCopies: number;
  description: string;
  relevanceScore: number;
  relevancePercentage: number;
  matchedKeywords: string[];
  searchMode: string;
  matchRationale: string;
  aisle?: string;
  shelf?: string;
  columnRack?: string;
}

export interface SearchComparison {
  query: string;
  keywordResults: Book[];
  keywordLatencyMs: number;
  keywordCount: number;
  semanticResults: SemanticSearchResult[];
  semanticLatencyMs: number;
  semanticCount: number;
  comparisonSummary: string;
}
