import 'package:flutter/material.dart';
import 'package:login_reg_authentication/view/login/login.dart';
//import 'package:login_reg_authentication/view/registration/registration.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Login());
  }
}
