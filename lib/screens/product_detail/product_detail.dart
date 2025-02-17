import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:trendhive/screens/home/common/common.dart';
import 'package:trendhive/screens/product_detail/controller/controller_product_detail.dart';
import 'package:trendhive/utils/assets.dart';
import 'package:trendhive/utils/sizes.dart';

import '../../common/app_widgets.dart';
import 'common/dropdown.dart';
import 'constants/constants.dart';

class ProductDetail extends StatelessWidget {
  ProductDetail({super.key});

  final controllerProductDetail = Get.put(ControllerProductDetail());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.grey,
          elevation: 1,
          title: const Text(
            "Short dress",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.share))
          ],
        ),
        body: SizedBox(
          width: context.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                XBuildImageSlider(
                  scrollController: controllerProductDetail.scrollController,
                  images: XAssets.bgImg,
                ),
                Container(
                  width: context.width,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          XDropDown(
                            hintText: RxString("Sizes"),
                            onContainerSizeTap: () {},
                            sizesOrColors: productDetailSizes,
                            headerText: "Select Size",
                          ),
                          XDropDown(
                            hintText: RxString("Colors"),
                            sizesOrColors: productDetailColors,
                            headerText: "Select Color",
                          ),
                          const XIconButtonFav(),
                        ],
                      ),
                      XSizes.boxHeight(0.015),
                      const Row(
                        children: [
                          Text(
                            "H&M",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                          Spacer(),
                          Text(
                            "\$19.99",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          )
                        ],
                      ),
                      const Text(
                        "Short black dress",
                        style: TextStyle(color: Colors.grey),
                      ),
                      XSizes.boxHeight(0.005),
                      const XRatingBar(),
                      XSizes.boxHeight(0.015),
                      const XReadMoreText(descriptionText: "Short dress in soft cotton jersey with decorative buttons down the front and wide, frill-trimmed square neckline with concealed elasticated. Elasticated seem under the bust and short puff sleaves with a small frill trim.",)
                    ],
                  ),
                ),
                XSizes.boxHeight(0.015),
                const XShippingInfoExpansionTile(),
                const XContactInfoExpansionTile(),
                XSizes.boxHeight(0.015),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "You can also like this",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            "12 items",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
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
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(14.5),
          height: XSizes.xHeight(0.103),
          width: context.width,
          color: Colors.white,
          child: XTextButton(
            title: "ADD TO CART",
            onTap: () {},
          ),
        ),
      ),
    );
  }
}

class XShippingInfoExpansionTile extends StatelessWidget {
  const XShippingInfoExpansionTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedShape: const ContinuousRectangleBorder(
        side: BorderSide(
          color: Colors.grey,
          width: 0.1,
        ),
      ),
      shape: const ContinuousRectangleBorder(
        side: BorderSide(
          color: Colors.grey,
          width: 0.1,
        ),
      ),
      title: const Text(
        "Shipping info",
        style: TextStyle(fontSize: 16),
      ),
      children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "• Free shipping on orders above \$50.",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 5),
              Text(
                "• Standard delivery: 5-7 business days.",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class XContactInfoExpansionTile extends StatelessWidget {
  const XContactInfoExpansionTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedShape: const ContinuousRectangleBorder(
        side: BorderSide(color: Colors.grey, width: 0.7),
      ),
      shape: const ContinuousRectangleBorder(
        side: BorderSide(
          color: Colors.grey,
          width: 0.7,
        ),
      ),
      title: const Text(
        "Support",
        style: TextStyle(fontSize: 16),
      ),
      children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          color: Colors.grey[50],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "For any questions or issues:",
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 5),
              const Row(
                children: [
                  Icon(Icons.email, color: Colors.blue, size: 18),
                  SizedBox(width: 5),
                  Text("support@example.com"),
                ],
              ),
              const SizedBox(height: 10),
              OutlinedButton.icon(
                onPressed: () {
                  // Action for call support
                },
                icon: const Icon(Icons.call, size: 18),
                label: const Text("Contact Us"),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.blueAccent),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class XBuildImageSlider extends StatelessWidget {
  const XBuildImageSlider(
      {super.key, required this.scrollController, required this.images});

  final ScrollController scrollController;
  final String images;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: XSizes.xHeight(0.51),
      width: context.width,
      color: Colors.white,
      child: RawScrollbar(
        controller: scrollController,
        thumbVisibility: true,
        child: ListView.builder(
          controller: scrollController,
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: XSizes.xWidth(0.72),
              margin: const EdgeInsets.only(right: 2),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    images,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class XReadMoreText extends StatelessWidget {
  const XReadMoreText({super.key, required this.descriptionText, this.descriptionColor=Colors.grey});

  final String descriptionText;
  final Color descriptionColor;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      descriptionText,
      style: TextStyle(color: descriptionColor),
      trimLength: 200,
      moreStyle: const TextStyle(color: Colors.grey),
      lessStyle: const TextStyle(color: Colors.grey),
      trimCollapsedText: "Read More",
      trimExpandedText: "Read Less",
    );
  }
}
