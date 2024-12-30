import 'package:flutter/material.dart';

class Bag extends StatelessWidget {
  const Bag({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Text("My Bag")
            ],
          ),
        ),
      ),
    );
  }
}
