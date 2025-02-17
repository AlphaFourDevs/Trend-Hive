import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendhive/firebase/firebase_options/firebase_options.dart';
import 'package:trendhive/rating_review/rating_review.dart';
// ignore: unused_import
import 'package:trendhive/screens/my_orders/my_orders.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    GetMaterialApp(
      home: RatingReview(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
