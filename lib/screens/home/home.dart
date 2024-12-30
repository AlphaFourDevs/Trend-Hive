import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendhive/utils/assets.dart';
import 'package:trendhive/utils/sizes.dart';

import 'common/common.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                height: XSizes.xHeight(0.25),
                width: context.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          XAssets.bgImg,
                        ),
                        fit: BoxFit.fill)),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Street Clothes",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sale",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 27,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            /// backend
                          },
                          child: Text(
                            "View all",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Super Summer Sale",
                      style: TextStyle(color: Colors.grey),
                    ),
                    XSizes.boxHeight(0.01),
                   KListView(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "New",
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "View all",
                              style: TextStyle(color: Colors.black),
                            ),
                        )
                      ],
                    ),
                    Text(
                      "You've never seen it before!",
                      style: TextStyle(color: Colors.grey),
                    ),
                    XSizes.boxHeight(0.01),
                   KListView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
