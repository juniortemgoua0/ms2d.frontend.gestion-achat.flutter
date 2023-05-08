import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
        backgroundColor: const Color(0xFF4B164C),
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
           BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color(0xFF4B164C),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Client',
            backgroundColor: Color(0xFF4B164C),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Catalogue',
            backgroundColor: Color(0xFF4B164C),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'Product',
            backgroundColor: Color(0xFF4B164C),
          ),
        ],
        onTap: (currentIndex) {
          Navigator.pushReplacementNamed(context, "AddClientPage");
        },
      ),
    );
  }
}
