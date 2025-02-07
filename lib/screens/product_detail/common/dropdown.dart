import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/app_widgets.dart';
import '../../../utils/sizes.dart';

class XDropDown extends StatelessWidget {
  XDropDown({
    super.key,
    required this.hintText,
    this.onContainerSizeTap,
    required this.sizesOrColors,
    required this.headerText,
  });

  final RxString hintText;
  final RxString tempText = RxString("");
  final String headerText;
  final VoidCallback? onContainerSizeTap;
  final List<String> sizesOrColors;
  final RxInt currentIndex = RxInt(0);



  void showSizeOrColorBottomSheet (BuildContext context){
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      isScrollControlled: true,
      useRootNavigator: true,
      useSafeArea: true,
      builder: (BuildContext context) {
        return Container(
          height: XSizes.xHeight(0.34),
          width: context.width,
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Text(
                headerText,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              XSizes.boxHeight(0.01),
              SizedBox(
                height: XSizes.xHeight(0.17),
                width: context.width,
                child: GridView.builder(
                  itemCount: sizesOrColors.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 60,
                    childAspectRatio: 1,
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    String sizeOrColor = sizesOrColors[index];
                    return GestureDetector(
                      onTap: () {
                        currentIndex.value = index;
                        tempText.value = sizesOrColors[currentIndex.value];
                      },
                      child: Obx(
                            () {
                          /// Logic area
                          final borderColor = (currentIndex.value == index)
                              ? Colors.red
                              : Colors.black;
                          final borderWidth =
                          (currentIndex.value == index) ? 2.0 : 0.5;
                          /// Return
                          return Container(
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: borderColor,
                                  width: borderWidth,
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(8))),
                            child: Center(
                              child: Text(
                                sizeOrColor,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              // XSizes.boxHeight(0.01),
              XTextButton(
                title: "Select",
                onTap: () {
                  hintText.value = tempText.value;
                  Navigator.pop(context);
                },
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /// Bottom Sheet
        showSizeOrColorBottomSheet(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        height: XSizes.xHeight(0.054),
        width: XSizes.xWidth(0.37),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => Text(
                hintText.value,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
