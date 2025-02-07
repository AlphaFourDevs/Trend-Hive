import 'package:flutter/material.dart';
import 'package:trendhive/utils/colors.dart';
import 'package:trendhive/utils/sizes.dart';

import '../../common/app_widgets.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Categories",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      backgroundColor: XColors.bgColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: XTextButton(
                title: "VIEW ALL ITEMS",
                onTap: () {},
              ),
            ),
            XSizes.boxHeight(0.01),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                "Choose categories",
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              ),
            ),
            CustomCategoryList(
              onTap: () {},
              title: "Tops",
            ),
            CustomCategoryList(
              onTap: () {},
              title: "Shirt and Blouses",
            ),
            CustomCategoryList(
              onTap: () {},
              title: "Sweaters",
            ),
            CustomCategoryList(
              onTap: () {},
              title: "Blazer",
            ),
            CustomCategoryList(
              onTap: () {},
              title: "Trousers",
            ),
            CustomCategoryList(
              onTap: () {},
              title: "OutWear",
            ),
            CustomCategoryList(
              onTap: () {},
              title: "Shorts",
            ),
            CustomCategoryList(
              onTap: () {},
              title: "Skirts",
            ),
            CustomCategoryList(
              onTap: () {},
              title: "Pants",
            ),
            CustomCategoryList(
              onTap: () {},
              title: "Dresses",
            ),
          ],
        ),
      ),
    ));
  }
}

class CustomCategoryList extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CustomCategoryList(
      {super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            onTap: () {},
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )),
        const Divider(
          thickness: 0.3,
          color: Colors.black26,
        ),
      ],
    );
  }
}
