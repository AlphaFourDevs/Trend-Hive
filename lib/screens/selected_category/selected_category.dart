import 'dart:core';
import 'package:flutter/material.dart';
import 'package:trendhive/screens/home/common/common.dart';
import 'package:trendhive/utils/sizes.dart';

class WomenTops extends StatelessWidget {
  const WomenTops({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Woman's Top",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          const SizedBox(
            width: 10,
          )
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xffF9F9F9),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.filter_list_sharp),
                      ),
                      // XSizes.boxWidth(0.008),
                      const Text("Filters"),
                    ],
                  ),
                  const Row(
                    children: [
                      Icon(Icons.arrow_circle_down_sharp),
                      Text("Price: Lowest to high")
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.format_list_bulleted))
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: XSizes.xHeight(0.75),
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 8,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.55,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return const XProductCard();
                  }
                  ),
            ),
          )
        ],
      ),
    ));
  }
}



