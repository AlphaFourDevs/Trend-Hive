import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:trendhive/common/app_widgets.dart';
import 'package:trendhive/screens/product_detail/product_detail.dart';
import 'package:trendhive/utils/sizes.dart';


class RatingReview extends StatelessWidget {
  RatingReview({super.key});

  final Map<int, int> ratings = {5: 12, 4: 5, 3: 4, 2: 2, 1: 0};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 12, right: 12, left: 12),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.arrow_back_ios),
                    XSizes.boxHeight(0.03),
                    const XPageTitle(pageTitle: "Rating&Reviews"),
                    XSizes.boxHeight(0.025),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "4.3",
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              "23 ratings",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                        XSizes.boxWidth(0.05),
                        SizedBox(
                          height: XSizes.xHeight(0.17),
                          width: 250,
                          child: ListView.builder(
                            itemCount: 5,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              final int count = ratings.keys.elementAt(index);
                              final int? value = ratings[count];
                              final double valuePercentage = value! / 23;
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  RatingBar.builder(
                                    onRatingUpdate: (rating) {},
                                    ignoreGestures: true,
                                    itemCount: count,
                                    unratedColor: Colors.amber,
                                    direction: Axis.horizontal,
                                    itemSize: 20,
                                    itemBuilder:
                                        (BuildContext context, int index) =>
                                            const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: XSizes.xWidth(0.275),
                                    child: LinearProgressIndicator(
                                      minHeight: 9,
                                      color: Colors.red,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(40)),
                                      value:
                                          value == 0 ? 0.05 : valuePercentage,
                                      backgroundColor: Colors.transparent,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: 30,
                                    child: Text(
                                      "$value",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "8 reviews",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Checkbox(
                          value: false,
                          side: BorderSide(
                              width: 1.8, color: Colors.grey.shade600),
                          onChanged: (value) {},
                        ),
                        const Text(
                          "With photo",
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          width: 12,
                        )
                      ],
                    ),
                    XSizes.boxHeight(0.01),
                    ListView.separated(
                      itemCount: 3,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 5,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return const XReviewCard();
                      },
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.grey,
                child: BackdropFilter(
                  filter: ImageFilter.blur(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class XReviewCard extends StatelessWidget {
  const XReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: Card(
            color: const Color(0xfff9f9f9),
            margin: const EdgeInsets.all(18),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Helene Moore",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // XRating(
                      //   itemCount: 5,
                      // ),
                      Text(
                        "june 5, 2019",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  XSizes.boxHeight(0.02),
                  XReadMoreText(
                    descriptionText:
                        "This dress is great! Very classy and comfortable. It fit perfectly! I'm 5'7 and 130 pounds.I am 34B chest. This dress would be too long for those who are shorter but could be hemmed. I wouldn't recommend it for those big chested and it fit me perfectly.The  underarms were not too wide and the dress was made well.",
                    descriptionColor: Colors.grey.shade700,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "Helpfull",
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                      XSizes.boxWidth(0.015),
                      const Icon(
                        Icons.thumb_up,
                        color: Colors.grey,
                        size: 17,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        const CircleAvatar(
          radius: 18,
          backgroundColor: Colors.grey,
        )
      ],
    );
  }
}
//
// ClipRRect(
// child: BackdropFilter(
// filter: ImageFilter.blur(
// sigmaX: 10,
// sigmaY: 10,
// ),
// child: ElevatedButton.icon(
// onPressed: () {},
// label: Text("Write a review"),
// icon: Icon(Icons.edit),
// iconAlignment: IconAlignment.start,
// ),
// ),
// ),


