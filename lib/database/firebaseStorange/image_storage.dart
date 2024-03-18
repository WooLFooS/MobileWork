import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ImageStorage {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  String? pathImageUrl;
  Future addImageStorage(XFile path)async{
    try {
      // Создаём путь в БД
      final pathImage = 'userLogo/${path.name}';
      // Для того чтобы название и папка были упорядочены
      Reference storageReference = _firebaseStorage.ref().child(pathImage);
      // Для загрузки картинки
      UploadTask uploadTask = storageReference.putFile(File(path.path));
      // снэпшот для того чтобы достать путь к картинке с облака
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

      pathImageUrl = await taskSnapshot.ref.getDownloadURL();

      print('Путь к картинке::::::::::::::::' + pathImageUrl!);
    } catch (e) {
      return null;
    }
  }

}