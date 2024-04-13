import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResponsesCollection {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void>addResponses(dynamic docs)async{
    try {
      final String uid = FirebaseAuth.instance.currentUser!.uid.toString();

      await _firebaseFirestore.collection('responses').add({
        'uid': uid,
        'post': docs['post'],
        'salary': docs['salary'],
        'description': docs['description'],
        'datePublication': docs['datePublication'],
        //'datePublication': datePublication,
        'workSchedule': docs['workSchedule'],
        'nameOrganization': docs['nameOrganization'],
      });
    } catch (e) {
      return;
    }
  }

  Future<void> deleteResponses(dynamic docs) async{
    try {
      await _firebaseFirestore.collection('responses').doc(docs.id).delete();
    } catch (e) {
      return;
    }
  }
}
