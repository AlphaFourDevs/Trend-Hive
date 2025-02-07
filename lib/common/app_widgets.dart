import 'package:flutter/material.dart';

import '../utils/sizes.dart';

class XIconButton extends StatelessWidget {
  const XIconButton({
    super.key,
    required this.iconData,
    required this.onTap,
  });

  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: XSizes.xHeight(0.05),
      width: XSizes.xWidth(0.105),
      child: IconButton(
        onPressed: onTap,
        style: IconButton.styleFrom(
            elevation: 1.5,
            shadowColor: Colors.grey,
            backgroundColor: Colors.white),
        icon: Icon(
          iconData,
          color: Colors.grey,
          size: 20,
        ),
      ),
    );
  }
}

class XTextButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const XTextButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          fixedSize: Size(XSizes.xWidth(0.93), XSizes.xHeight(0.062)),
          backgroundColor: Colors.red),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}

class XPageTitle extends StatelessWidget {
  const XPageTitle({super.key, required this.pageTitle});

  final String pageTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      pageTitle,
      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}

class XTextFormField extends StatelessWidget {
  const XTextFormField({super.key, required this.label, this.suffixIconData, this.onTapValidator, this.controller});

  final String label;
  final IconData? suffixIconData;
  final String? Function(String?)? onTapValidator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Colors.white,
      ),
      child: Center(
        child: TextFormField(
          controller: controller,
          validator: onTapValidator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            border: InputBorder.none,
            // enabledBorder: InputBorder.none,
            // focusedBorder: InputBorder.none,
            // errorBorder: OutlineInputBorder(),
            suffixIcon: Icon(suffixIconData),
            suffixIconColor: Colors.green,
            labelText: label,
            labelStyle: const TextStyle(color: Colors.grey, fontSize: 14,),
            fillColor: Colors.white,
            filled: true,
          ),
        ),
      ),
    );
  }
}
