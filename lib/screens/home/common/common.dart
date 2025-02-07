import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../utils/assets.dart';
import '../../../utils/sizes.dart';

class XIconButtonFav extends StatelessWidget {
  const XIconButtonFav({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      style: IconButton.styleFrom(
          shadowColor: Colors.grey,
          elevation: 0.5,
          backgroundColor: Colors.white),
      icon: const Icon(
        Icons.favorite_outline,
      ),
    );
  }
}

class XProductCard extends StatelessWidget {
  const XProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: XSizes.xWidth(0.43),
      margin: const EdgeInsets.all(2),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                width: context.width,
                height: XSizes.xHeight(0.25),
                decoration: BoxDecoration(
                  borderRadius:
                  const BorderRadius.all(Radius.circular(6)),
                  image: DecorationImage(
                      image: AssetImage(
                        XAssets.bgImg,
                      ),
                      fit: BoxFit.fill),
                ),
              ),
              XSizes.boxHeight(0.013),
              const XRatingBar(),
              const Text(
                "Dorothy Perkins",
                style: TextStyle(color: Colors.grey),
              ),
              const Text(
                "Evening Dress",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "15\$",
                      style: TextStyle(
                          decoration:
                          TextDecoration.lineThrough,
                          color: Colors.grey),
                    ),
                    TextSpan(text: " "),
                    TextSpan(
                        text: "20\$",
                        style: TextStyle(color: Colors.red))
                  ],
                ),
              )
            ],
          ),
          Container(
            height: 30,
            width: 45,
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius:
                BorderRadius.all(Radius.circular(13))),
            margin: const EdgeInsets.all(8),
            child: const Center(
              child: Text(
                "-20%",
                style: TextStyle(
                    color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(top: 65),
              child: XIconButtonFav(),
            ),
          ),
        ],
      ),
    );
  }
}

class XRatingBar extends StatelessWidget {
  const XRatingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar.builder(
          onRatingUpdate: (rating) {},
          itemBuilder:
              (BuildContext context, int index) =>
          const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          itemCount: 5,
          direction: Axis.horizontal,
          itemSize: 20,
        ),
        const Text(
          "(10)",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
