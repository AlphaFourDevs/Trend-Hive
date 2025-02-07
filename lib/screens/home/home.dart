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
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                height: XSizes.xHeight(0.25),
                width: context.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          XAssets.bgImg,
                        ),
                        fit: BoxFit.fill)),
                child: const Align(
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
                padding: const EdgeInsets.fromLTRB(10, 8, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
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
                          child: const Text(
                            "View all",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      "Super Summer Sale",
                      style: TextStyle(color: Colors.grey),
                    ),
                    XSizes.boxHeight(0.01),
                    SizedBox(
                      height: XSizes.xHeight(0.4),
                      width: context.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return const XProductCard();
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "New",
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              "View all",
                              style: TextStyle(color: Colors.black),
                            ),
                        ),
                      ],
                    ),
                    const Text(
                      "You've never seen it before!",
                      style: TextStyle(color: Colors.grey),
                    ),
                    XSizes.boxHeight(0.01),
                    SizedBox(
                      height: XSizes.xHeight(0.4),
                      width: context.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return const XProductCard();
                        },
                      ),
                    ),
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
