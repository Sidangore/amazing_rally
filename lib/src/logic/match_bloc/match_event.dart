part of 'match_bloc.dart';

abstract class MatchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadMatches extends MatchEvent {
  final String userId;
  LoadMatches(this.userId);
  @override
  List<Object?> get props => [userId];
}

class AddMatch extends MatchEvent {
  final BMMatch match;
  AddMatch(this.match);
  @override
  List<Object?> get props => [match];
}
