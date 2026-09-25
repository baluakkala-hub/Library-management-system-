export interface ResearchBenchmark {
  averageKeywordLatencyMs: number;
  averageSemanticLatencyMs: number;
  latencySpeedupFactor: number;
  recommendationPrecisionAt3: number;
  recommendationRecallAt3: number;
  meanReciprocalRank: number;
  demandPredictionMae: number;
  demandPredictionRmse: number;
  totalQueriesEvaluated: number;
  totalRecommendationsServed: number;
  evaluationTimestamp: string;
}
