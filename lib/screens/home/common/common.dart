import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../utils/assets.dart';
import '../../../utils/sizes.dart';

class KListView extends StatelessWidget {
  const KListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: XSizes.xHeight(0.4),
      width: context.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: XSizes.xWidth(0.43),
            margin: EdgeInsets.all(2),
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
                        BorderRadius.all(Radius.circular(6)),
                        image: DecorationImage(
                            image: AssetImage(
                              XAssets.bgImg,
                            ),
                            fit: BoxFit.fill),
                      ),
                    ),
                    XSizes.boxHeight(0.013),
                    Row(
                      children: [
                        RatingBar.builder(
                          onRatingUpdate: (rating) {},
                          itemBuilder:
                              (BuildContext context, int index) =>
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                          itemCount: 5,
                          direction: Axis.horizontal,
                          itemSize: 20,
                        ),
                        Text(
                          "(10)",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Text(
                      "Dorothy Perkins",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Evening Dress",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text.rich(
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
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius:
                      BorderRadius.all(Radius.circular(13))),
                  margin: EdgeInsets.all(8),
                  child: Center(
                    child: Text(
                      "-20%",
                      style: TextStyle(
                          color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(top: 65),
                    child: IconButton(
                      onPressed: () {},
                      style: IconButton.styleFrom(
                          shadowColor: Colors.grey,
                          elevation: 0.5,
                          backgroundColor: Colors.white),
                      icon: Icon(
                        Icons.favorite_outline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
