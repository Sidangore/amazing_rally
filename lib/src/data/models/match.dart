
import 'package:badminton_1/src/data/models/match_stats.dart';

class BMMatch {
  final String id, userId, type, opponent;
  final List<String> players;
  final DateTime date;
  final MatchStats stats;
  BMMatch({
    required this.id,
    required this.userId,
    required this.type,
    required this.players,
    required this.opponent,
    required this.date,
    required this.stats,
  });

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'type': type,
    'players': players,
    'opponent': opponent,
    'date': date.toIso8601String(),
    'stats': stats.toJson(),
  };

  factory BMMatch.fromJson(Map<String, dynamic> json, String id) => BMMatch(
    id: id,
    userId: json['userId'],
    type: json['type'],
    players: List<String>.from(json['players']),
    opponent: json['opponent'],
    date: DateTime.parse(json['date']),
    stats: MatchStats.fromJson(json['stats']),
  );
}