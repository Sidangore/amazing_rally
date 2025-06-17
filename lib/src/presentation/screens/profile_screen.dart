import 'package:badminton_1/src/presentation/screens/add_match_screen.dart';
import 'package:badminton_1/src/presentation/screens/match_history_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/auth_bloc/auth_bloc.dart';

class ProfileScreen extends StatelessWidget {
  final User user;
  const ProfileScreen({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, ${user.email}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => context.read<AuthBloc>().add(AuthLoggedOut()),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => AddMatchScreen(userId: user.uid)),
                );
              },
              child: const Text('Add Match'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => MatchHistoryScreen(userId: user.uid)),
                );
              },
              child: const Text('Match History'),
            ),
          ],
        ),
      ),
    );
  }
}
