// lib/src/ui/widgets/match_card.dart
import 'package:badminton_1/src/data/models/match.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MatchCard extends StatelessWidget {
  final BMMatch match;
  const MatchCard({required this.match, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final date = DateFormat.yMMMd().format(match.date);
    final resultText = match.stats.didWin ? 'Won' : 'Lost';

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        title: Text('$resultText vs ${match.opponent}',
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('$date • ${match.stats.totalPoints} pts'),
        trailing: Icon(
          match.stats.didWin ? Icons.thumb_up : Icons.thumb_down,
          color: match.stats.didWin ? Colors.green : Colors.red,
        ),
        onTap: () {
          // Optionally navigate to a detailed match screen
        },
      ),
    );
  }
}
