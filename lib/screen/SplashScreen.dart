import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/splash.png",
              height: 300,
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child:const Text(
                "Buy your product",
                style: TextStyle(
                  color: Color(0xFF4B164C),
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 50),
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, "ListClientPage");
              },
              child: Ink(
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xFF4B164C),
                ),
                child: const Text(
                  "Get started",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        )));
  }
}
