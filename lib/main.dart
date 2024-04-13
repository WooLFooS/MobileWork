import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_work/database/firebaseAuth/users_service.dart';
import 'package:flutter_work/routes/routes.dart';
import 'package:flutter_work/themes/darktTheme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyBmXE3qWapgo0FYbGQpASad2aCA45qH9pM',
      appId: '1:98259379734:android:81569eb51fba29ae34b737',
      messagingSenderId: '98259379734',
      projectId: 'flutter-work-2bff2',
      storageBucket: 'flutter-work-2bff2.appspot.com',
    ),
  );
  runApp(const ThemeAppMaterial());
}

class ThemeAppMaterial extends StatelessWidget {
  const ThemeAppMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      initialData: null,
      value: AuthService().currentUser,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: dark,
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}
