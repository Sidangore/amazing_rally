part of 'score_bloc.dart';

abstract class ScoreEvent {}

class ScoreEventPointToLeft extends ScoreEvent {}

class ScoreEventPointToRight extends ScoreEvent {}

class ScoreEventStartNewMatch extends ScoreEvent {}