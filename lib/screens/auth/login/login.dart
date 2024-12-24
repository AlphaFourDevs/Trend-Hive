import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendhive/utils/assets.dart';
import 'package:trendhive/utils/sizes.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: context.width,
          color: Colors.white,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  /// backend
                },
                icon: Icon(Icons.arrow_back),
              ),
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
