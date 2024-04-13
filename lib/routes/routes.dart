// import 'dart:js';


import 'package:flutter_work/landing.dart';
import 'package:flutter_work/pages/add_vacancy.dart';
import 'package:flutter_work/pages/auth.dart';
import 'package:flutter_work/pages/edit_password.dart';
import 'package:flutter_work/pages/home.dart';
import 'package:flutter_work/pages/profile_resumes/add_resumes.dart';
import 'package:flutter_work/pages/reg.dart';

final routes = {
  '/': (context) => const LandingPage(),
  '/auth': (context) => const AuthPage(),
  '/reg': (context) => const RegistrationPage(),
  '/home': (context) => const HomePage(),
  '/add_resumes':(context) => const AddResumesPage(),
  '/add_vacancy':(context) => const AddVacancyPage(),
  '/edit_password':(context) => const EditPasswordPage(),
};