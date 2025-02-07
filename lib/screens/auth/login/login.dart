import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trendhive/common/app_widgets.dart';
import 'package:trendhive/utils/colors.dart';
import 'package:trendhive/utils/sizes.dart';

import '../../../utils/assets.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: XColors.bgColor,
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Listener(
            behavior: HitTestBehavior.translucent,
            onPointerDown: (_) {
              FocusScope.of(context).unfocus();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                XSizes.boxHeight(0.01),
                const Icon(Icons.arrow_back_ios),
                XSizes.boxHeight(0.03),
                const XPageTitle(pageTitle: "Login"),
                XSizes.boxHeight(0.09),
                const XTextFormField(
                  label: "Email",
                  suffixIconData: Icons.check,
                ),
                XSizes.boxHeight(0.02),
                const XTextFormField(label: "Password"),
                XSizes.boxHeight(0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text("Forget your password?"),
                    XSizes.boxWidth(0.03),
                    const Icon(
                      Icons.arrow_forward,
                      color: Colors.red,
                    )
                  ],
                ),
                XSizes.boxHeight(0.03),
                XTextButton(
                  title: "LOG IN",
                  onTap: () {},
                ),
                const Spacer(),
                const Center(
                    child: Text(
                  "Or log in with social account",
                  style: TextStyle(fontSize: 15),
                )),
                XSizes.boxHeight(0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    XLogoInput(logo: XAssets.googleLogo),
                    XSizes.boxWidth(0.03),
                    XLogoInput(logo: XAssets.faceBookLogo),
                  ],
                ),
                XSizes.boxHeight(0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class XLogoInput extends StatelessWidget {
  const XLogoInput({super.key, required this.logo});

  final String logo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      height: XSizes.xHeight(0.075),
      width: XSizes.xWidth(0.22),
      child: SvgPicture.asset(
        logo,
      ),
    );
  }
}
