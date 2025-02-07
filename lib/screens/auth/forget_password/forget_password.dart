import 'package:flutter/material.dart';
import 'package:trendhive/common/app_widgets.dart';
import 'package:trendhive/utils/colors.dart';
import 'package:trendhive/utils/sizes.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController forgetPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: XColors.bgColor,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Listener(
            behavior: HitTestBehavior.translucent,
            onPointerDown: (_){FocusScope.of(context).unfocus();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                XSizes.boxHeight(0.01),
                const Icon(Icons.arrow_back_ios),
                XSizes.boxHeight(0.03),
                const XPageTitle(pageTitle: "Forget password"),
                XSizes.boxHeight(0.1),
                const Text(
                  "Please, enter your email address. You will receive a link to create a new password via email.",
                ),
                XSizes.boxHeight(0.03),
                Form(
                  key: _formKey,
                  child: XTextFormField(
                    label: "Email",
                    controller: forgetPasswordController,
                    onTapValidator: (value) {
                      if(value!.isEmpty){
                        return "Not a valid email address. Should be your @email.com";
                      }
                      return null;
                    },
                  ),
                ),
                XSizes.boxHeight(0.06),
                XTextButton(
                  title: "SEND",
                  onTap: () {
                    if(!_formKey.currentState!.validate()){
                      print("Invalid");
                      return ;
                    }
                    print("valid email");
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
