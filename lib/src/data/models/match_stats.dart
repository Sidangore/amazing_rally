class MatchStats {
  final int totalPoints;
  final bool didWin;
  MatchStats({
    required this.totalPoints,    
    required this.didWin,
  });

  Map<String, dynamic> toJson() => {
    'totalPoints': totalPoints,
    'didWin': didWin,
  };

  factory MatchStats.fromJson(Map<String, dynamic> json) => MatchStats(
    totalPoints: json['totalPoints'],
    didWin: json['didWin'],
  );
}