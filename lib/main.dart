import 'package:flutter/material.dart';
import 'package:gestion_achat_front/screen/AddClientPage.dart';
import 'package:gestion_achat_front/screen/HomePage.dart';
import 'package:gestion_achat_front/screen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => SplashScreen(),
        "HomePage": (context) => HomePage(),
        "AddClientPage": (context) => AddClientPage(),
      },
    );
  }
}
