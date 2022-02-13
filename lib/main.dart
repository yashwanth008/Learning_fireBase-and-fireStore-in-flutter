import 'package:firebase_auth_testing/Pages/Auth/LoginPage.dart';
import 'package:firebase_auth_testing/Pages/Auth/SignUp.dart';
import 'package:firebase_auth_testing/Pages/Auth/resetPassword.dart';
import 'package:firebase_auth_testing/Pages/LandingPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Pages/entryScreen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/loginPage':(context) => const LoginPage(),
        '/SignUp':(context) => const SignUp(),
        '/landingPage':(context)=> const LandingPage(),
        '/resetPassword':(context) => const resetPassword(),

      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

