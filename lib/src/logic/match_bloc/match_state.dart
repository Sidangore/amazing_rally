part of 'match_bloc.dart';

abstract class MatchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MatchInitial extends MatchState {}

class MatchLoading extends MatchState {}

class MatchLoaded extends MatchState {
  final List<BMMatch> matches;
  MatchLoaded(this.matches);
  @override
  List<Object?> get props => [matches];
}

class MatchError extends MatchState {
  final String error;
  MatchError(this.error);
  @override
  List<Object?> get props => [error];
}
