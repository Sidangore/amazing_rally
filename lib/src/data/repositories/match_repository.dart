import 'package:badminton_1/src/data/models/match.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MatchRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addMatch(BMMatch match) {
    return _firestore.collection('matches').add(match.toJson());
  }

  Stream<List<BMMatch>> getMatches(String userId) {
    return _firestore
        .collection('matches')
        .where('userId', isEqualTo: userId)
        .orderBy('date', descending: true)
        .snapshots()
        .map((snap) => snap.docs
            .map((doc) => BMMatch.fromJson(doc.data(), doc.id))
            .toList());
  }
}
