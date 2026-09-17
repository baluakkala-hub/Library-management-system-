export interface DemandForecast {
  itemKey: string;
  category: string;
  currentTotalCopies: number;
  currentAvailableCopies: number;
  historicalBorrowCount: number;
  predictedMonthlyDemand: number;
  demandTrend: 'SURGING' | 'MODERATE' | 'STABLE' | 'LOW';
  stressRatio: number;
  riskLevel: 'HIGH' | 'MEDIUM' | 'LOW';
  suggestedCopiesToOrder: number;
  explanation: string;
  monthlyHistory: number[];
}
