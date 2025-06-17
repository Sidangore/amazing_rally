import 'package:badminton_1/src/logic/match_bloc/match_bloc.dart';
import 'package:badminton_1/src/presentation/widgets/match_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatchHistoryScreen extends StatelessWidget {
  final String userId;
  const MatchHistoryScreen({required this.userId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          MatchBloc(RepositoryProvider.of(context))..add(LoadMatches(userId)),
      child: Scaffold(
        appBar: AppBar(title: const Text('Match History')),
        body: BlocBuilder<MatchBloc, MatchState>(
          builder: (context, state) {
            if (state is MatchLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is MatchLoaded) {
              return ListView.builder(
                itemCount: state.matches.length,
                itemBuilder: (_, i) => MatchCard(match: state.matches[i]),
              );
            }
            if (state is MatchError) return Center(child: Text(state.error));
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
