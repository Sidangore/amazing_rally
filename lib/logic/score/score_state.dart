part of 'score_bloc.dart';

class ScoreState {
  final int leftScore;
  final int rightScore;

  ScoreState({required this.leftScore, required this.rightScore});

  ScoreState copyWith({int? leftScore, int? rightScore}) {
    return ScoreState(leftScore: leftScore ?? this.leftScore, rightScore: rightScore ?? this.rightScore);
  }
}

