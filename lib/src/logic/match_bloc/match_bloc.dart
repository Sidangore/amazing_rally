import 'package:badminton_1/src/data/models/match.dart';
import 'package:badminton_1/src/data/repositories/match_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'match_event.dart';
part 'match_state.dart';

class MatchBloc extends Bloc<MatchEvent, MatchState> {
  final MatchRepository _matchRepo;
  MatchBloc(this._matchRepo) : super(MatchInitial()) {
    on<LoadMatches>((event, emit) async {
      emit(MatchLoading());
      try {
        final list = await _matchRepo.getMatches(event.userId).first;
        emit(MatchLoaded(list));
      } catch (e) {
        emit(MatchError(e.toString()));
      }
    });

    on<AddMatch>((event, emit) async {
      try {
        await _matchRepo.addMatch(event.match);
        add(LoadMatches(event.match.userId));
      } catch (e) {
        emit(MatchError(e.toString()));
      }
    });
  }
}
