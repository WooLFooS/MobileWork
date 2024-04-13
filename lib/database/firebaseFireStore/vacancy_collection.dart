import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class VacancyCollection{
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<void> addVacancy(
    //String id,
    String post,
    String salary,
    String description,
    //String datePublication,
    String workSchedule,
    //String idEmployer,
    String nameOrganization,
  ) async{
    final uid = FirebaseAuth.instance.currentUser!.uid.toString();
     final DateTime now = DateTime.now();
      final DateFormat dateFormat = DateFormat('dd-MM-yyyy');
      final String formated = dateFormat.format(now);
    try {
      await _firebaseFirestore.collection('vacancy').add({
        'id': uid,
        'post': post,
        'salary': salary,
        'description': description,
        'datePublication': formated,
        //'datePublication': datePublication,
        'workSchedule': workSchedule,
        //'idEmployer': idEmployer,
        'nameOrganization': nameOrganization,
      });
    } catch (e) {
      return;
    }
  }

  Future<void> editProfile(
    dynamic docs,
    String post,
    String salary,
    String description,
    String workSchedule,
  ) async {
    try {
       await _firebaseFirestore.collection('vacancy').doc(docs.id).update({
        'post': post,
        'salary': salary,
        'description': description,
        'workSchedule': workSchedule,
      });
    } catch (e) {
      return;
    }
  }
  Future<void> deleteProfile(
    dynamic docs,
  ) async {
    try {
       await _firebaseFirestore.collection('vacancy').doc(docs.id).delete();
    } catch (e) {
      return;
    }
  }
}