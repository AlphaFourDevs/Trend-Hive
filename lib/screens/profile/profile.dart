import 'package:flutter/material.dart';
import 'package:trendhive/utils/sizes.dart';

import '../../common/app_widgets.dart';


class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search_outlined),
                  ),
                )
              ],
            ),
            XSizes.boxHeight(0.018),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: XPageTitle(pageTitle: "My profile"),
            ),
            XSizes.boxHeight(0.03),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        "https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"),
                  ),
                  XSizes.boxWidth(0.02),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nafisa Tahir",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        "nafisaBaji@gmail",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Color(0xff9B9B9B)),
                      )
                    ],
                  )
                ],
              ),
            ),
            XSizes.boxHeight(0.025),
            CustomListTile(
              title: "My orders",
              subtitle: "Already have 12 orders",
              onTap: () {},
            ),
            CustomListTile(
              title: "Shipping Addresses",
              subtitle: "3 Addresses",
              onTap: () {},
            ),
            CustomListTile(
              title: "Payment Methods",
              subtitle: "Visa **343",
              onTap: () {},
            ),
            CustomListTile(
              title: "Promo Codes",
              subtitle: "You have special promo codes",
              onTap: () {},
            ),
            CustomListTile(
              title: "My Reviews",
              subtitle: "Reviews for 4 items",
              onTap: () {},
            ),
            CustomListTile(
              title: "Settings",
              subtitle: "Notifications,Password",
              onTap: () {},
            )
          ],
        ),
      ),
    ));
  }
}

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onTap;

  const CustomListTile({
    super.key,
    required this.subtitle,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {},
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(subtitle, style: const TextStyle(color: Color(0xff9B9B9B))),
          trailing: IconButton(
              onPressed: () => onTap,
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 22,
              )),
        ),
        const Divider(
          thickness: 0.3,
          color: Colors.black26,
        ),
      ],
    );
  }
}
