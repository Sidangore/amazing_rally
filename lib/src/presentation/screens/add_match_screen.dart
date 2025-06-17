import 'package:badminton_1/src/constants/enum/match_type_enum.dart';
import 'package:badminton_1/src/data/models/match.dart';
import 'package:badminton_1/src/data/models/match_stats.dart';
import 'package:badminton_1/src/logic/match_bloc/match_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddMatchScreen extends StatefulWidget {
  final String userId;
  const AddMatchScreen({required this.userId, Key? key}) : super(key: key);

  @override
  AddMatchScreenState createState() => AddMatchScreenState();
}

class AddMatchScreenState extends State<AddMatchScreen> {
  final _opponentController = TextEditingController();
  MatchType _type = MatchType.singles;
  final _pointsController = TextEditingController();
  bool _didWin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Match')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            DropdownButtonFormField<MatchType>(
              value: _type,
              items: MatchType.values
                  .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
                  .toList(),
              onChanged: (v) => setState(() => _type = v!),
              decoration: const InputDecoration(labelText: 'Match Type'),
            ),
            TextField(
              controller: _opponentController,
              decoration: const InputDecoration(labelText: 'Opponent'),
            ),
            TextField(
                controller: _pointsController,
                decoration: const InputDecoration(labelText: 'Total Points'),
                keyboardType: TextInputType.number),
            SwitchListTile(
              title: const Text('Win'),
              value: _didWin,
              onChanged: (v) => setState(() => _didWin = v),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final match = BMMatch(
                  id: '',
                  userId: widget.userId,
                  type: _type.name,
                  players: [widget.userId],
                  opponent: _opponentController.text,
                  date: DateTime.now(),
                  stats: MatchStats(
                    totalPoints: int.parse(_pointsController.text),
                    didWin: _didWin,
                  ),
                );
                context.read<MatchBloc>().add(AddMatch(match));
                Navigator.pop(context);
              },
              child: const Text('Save Match'),
            ),
          ],
        ),
      ),
    );
  }
}
