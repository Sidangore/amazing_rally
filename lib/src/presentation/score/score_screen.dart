import 'package:badminton_1/src/logic/score/score_bloc.dart';
import 'package:badminton_1/src/presentation/score/score_display_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  void _handleDoubleTap(BuildContext context, TapDownDetails details) {
    final width = MediaQuery.of(context).size.width;
    final tapX = details.localPosition.dx;
    final bloc = context.read<ScoreBloc>();

    if (tapX < width / 2) {
      bloc.add(ScoreEventPointToLeft());
    } else {
      bloc.add(ScoreEventPointToRight());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onDoubleTapDown: (details) => _handleDoubleTap(context, details),
      child: Center(
        child: BlocBuilder<ScoreBloc, ScoreState>(
          builder: (context, state) {
            return Row(
              children: [
                ScoreDisplay(score: state.leftScore),                
                ScoreDisplay(score: state.rightScore),
              ],
            );
          },
        ),
      ),
    );
  }
}
