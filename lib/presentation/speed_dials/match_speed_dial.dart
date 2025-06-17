import 'package:badminton_1/constants/constants.dart';
import 'package:badminton_1/logic/score/score_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class MatchSpeedDial extends StatelessWidget {
  const MatchSpeedDial({super.key});

  @override
  Widget build(BuildContext context) {
    final ScoreBloc scoreBloc = BlocProvider.of<ScoreBloc>(context);

    return SpeedDial(
      icon: Icons.sports,
      activeIcon: Icons.close,
      backgroundColor: kCourtColor,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.sports),
          label: 'Start a new match',
          onTap: () {
            scoreBloc.add(ScoreEventStartNewMatch());
          },
        ),
        // Add more options as needed
      ],
    );
  }
}
