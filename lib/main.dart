import 'package:badminton_1/logic/observer/simple_bloc_observer.dart';
import 'package:badminton_1/logic/score/score_bloc.dart';
import 'package:badminton_1/presentation/background.dart';
import 'package:badminton_1/presentation/player/players_screen.dart';
import 'package:badminton_1/presentation/score/score_screen.dart';
import 'package:badminton_1/presentation/speed_dials/speed_dials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ScoreBloc(),
        child: const Scaffold(
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SettingSpeedDials(),
              SizedBox(width: 10),
              MatchSpeedDial(),
            ],
          ),
          body: SafeArea(
            child: Stack(
              children: [
                Background(),
                ScoreScreen(),
                PlayerOverlay(
                  topLeftName: "Alice",
                  topRightName: "Bob",
                  bottomLeftName: "Carol",
                  bottomRightName: "Dave",
                  servingQuadrant: "topLeft", // or whichever is serving
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
