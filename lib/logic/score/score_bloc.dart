import 'package:flutter_bloc/flutter_bloc.dart';

part 'score_event.dart';
part 'score_state.dart';

class ScoreBloc extends Bloc<ScoreEvent, ScoreState> {
  ScoreBloc() : super(ScoreState(leftScore: 0, rightScore: 0)) {
    on<ScoreEventPointToLeft>(_onPointToLeft);
    on<ScoreEventPointToRight>(_onPointToRight);
    on<ScoreEventStartNewMatch>(_onStartNewMatch);
  }

  void _onPointToLeft(ScoreEventPointToLeft event, Emitter<ScoreState> emit) {
    emit(state.copyWith(leftScore: state.leftScore + 1));
  }

  void _onPointToRight(ScoreEventPointToRight event, Emitter<ScoreState> emit) {
    emit(state.copyWith(rightScore: state.rightScore + 1));
  }

  void _onStartNewMatch(ScoreEventStartNewMatch event, Emitter<ScoreState> emit) {
    emit(ScoreState(leftScore: 0, rightScore: 0));
  }


}