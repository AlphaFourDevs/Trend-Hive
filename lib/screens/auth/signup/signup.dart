import 'package:flutter/material.dart';
import 'package:trendhive/common/app_widgets.dart';

import 'package:trendhive/utils/colors.dart';
import 'package:trendhive/utils/sizes.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: XColors.bgColor,
        body: SingleChildScrollView(  // Added this widget to enable scrolling
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                XSizes.boxHeight(0.01),
                const Icon(Icons.arrow_back_ios),
                XSizes.boxHeight(0.03),
                const XPageTitle(pageTitle: "Sign up"),
                XSizes.boxHeight(0.05),
                const XTextFormField(label: "Name"),
                XSizes.boxHeight(0.02),
                const XTextFormField(label: "Email"),
                XSizes.boxHeight(0.02),
                const XTextFormField(label: "Password"),
                XSizes.boxHeight(0.03),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Already have an account?"),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.red,
                    )
                  ],
                ),
                XSizes.boxHeight(0.03),
                XTextButton(title: "SIGN UP",onTap: (){},),
                XSizes.boxHeight(0.1),
                // Adjusted the space after the button
                const Center(
                    child: Text(
                      "Or sign up with social media accounts",
                      style: TextStyle(fontSize: 17),
                    )),
                XSizes.boxHeight(0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.network(
                          "https://thumbs.dreamstime.com/b/whatsapp-logo-vector-ai-file-squared-colored-colored-whatsapp-logo-vector-ai-file-easily-editable-have-white-138331786.jpg?w=768",
                          fit: BoxFit.cover,
                          height: 45,
                          width: 55,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.network(
                          "https://thumbs.dreamstime.com/b/facebook-logo-vector-ai-file-squared-coloured-coloured-facebook-logo-vector-ai-file-easily-editable-have-white-138330202.jpg?w=768",
                          fit: BoxFit.cover,
                          height: 45,
                          width: 55,
                        ),
                      ),
                    ),
                  ],
                ),
                XSizes.boxHeight(0.03),  // Added padding after social media buttons
              ],
            ),
          ),
        ),
      ),
    );
  }
}