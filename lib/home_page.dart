import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  int num = 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text(
            'Learn Flutter in $num Hours',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
