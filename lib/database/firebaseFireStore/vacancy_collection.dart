import 'package:cloud_firestore/cloud_firestore.dart';

class VacancyCollection{
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<void> addVacancy(
    String id,
    String post,
    String salary,
    String description,
    String datePublication,
    String workSchedule,
    String idEmployer,
    String nameOrganization,
  ) async{
    try {
      await _firebaseFirestore.collection('vacancy').add({
        'id': id,
        'post': post,
        'salary': salary,
        'description': description,
        'datePublication': datePublication,
        'workSchedule': workSchedule,
        'idEmployer': idEmployer,
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