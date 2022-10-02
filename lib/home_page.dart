import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        "Home page",
        style: TextStyle(
            color: Colors.amberAccent,
            fontSize: 65,
            fontWeight: FontWeight.w700),
      )),
    );
  }
}
