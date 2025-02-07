import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendhive/utils/assets.dart';
import 'package:trendhive/utils/sizes.dart';

import '../../common/app_widgets.dart';

class Bag extends StatelessWidget {
  const Bag({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          size: 28,
                        ))),
                const Text(
                  "My Bag",
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                ),
                XSizes.boxHeight(0.01),
                SizedBox(
                  height: XSizes.xHeight(0.48),
                  width: context.width,
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                        key: const Key("value"),
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          color: Colors.grey[350],
                          child: const Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                            size: 40,
                          ),
                        ),
                        confirmDismiss: (value) async {
                          return await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: const Text(
                                    'Remove From Cart',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(true);
                                      },
                                      style: TextButton.styleFrom(
                                          backgroundColor: Colors.green),
                                      child: const Text(
                                        'Yes',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(false);
                                      },
                                      style: TextButton.styleFrom(
                                          backgroundColor: Colors.green),
                                      child: const Text(
                                        'No',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                  ],
                                );
                              });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(8)),
                            border: Border.all(color: Colors.grey, width: 0.1),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 1,
                                spreadRadius: 0.5,
                                offset: const Offset(0, 1),
                              )
                            ],
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          width: context.width,
                          height: XSizes.xHeight(0.15),
                          child: Row(
                            children: [
                              Container(
                                width: XSizes.xWidth(0.37),
                                height: XSizes.xHeight(0.15),
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.horizontal(
                                      left: Radius.circular(8)),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      XAssets.bgImg,
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              XSizes.boxWidth(0.035),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "Pullover",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      XSizes.boxWidth(0.2),
                                      SizedBox(
                                        height: XSizes.xHeight(0.05),
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.more_vert_outlined,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Color: ",
                                              style: TextStyle(color: Colors.grey),
                                            ),
                                            TextSpan(text: "Black"),
                                          ],
                                        ),
                                      ),
                                      XSizes.boxWidth(0.02),
                                      const Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Size: ",
                                              style: TextStyle(color: Colors.grey),
                                            ),
                                            TextSpan(text: "L"),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  XSizes.boxHeight(0.01),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      XIconButton(
                                        iconData: Icons.add,
                                        onTap: () {},
                                      ),
                                      XSizes.boxWidth(0.02),
                                      const Text("1"),
                                      XSizes.boxWidth(0.02),
                                      XIconButton(
                                        iconData: Icons.remove,
                                        onTap: () {},
                                      ),
                                      XSizes.boxWidth(0.13),
                                      const Text(
                                        "51\$",
                                        style:
                                            TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                XSizes.boxHeight(0.025),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter your promo code",
                    hintStyle: const TextStyle(color: Colors.grey),
                    fillColor: Colors.white,
                    filled: true,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(10),
                        right: Radius.circular(25),
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      style: IconButton.styleFrom(
                          backgroundColor: Colors.grey.shade900),
                      icon: const Icon(
                        Icons.arrow_forward_outlined,
                        color: Colors.white,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(10),
                  ),
                ),
                XSizes.boxHeight(0.025),
                Row(
                  children: [
                    Text(
                      "Total amount:",
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 17),
                    ),
                    const Spacer(),
                    const Text(
                      "124\$",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
                XSizes.boxHeight(0.025),
                XTextButton(
                  title: "CHECK OUT",
                  onTap: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
