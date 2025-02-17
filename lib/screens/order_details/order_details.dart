import 'package:flutter/material.dart';

class OrderDetail extends StatelessWidget {
  const OrderDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xffF2F2F2),
          appBar: AppBar(
            title: const Text("Order Detail"),
            elevation: 0.2,
            centerTitle: true,
            leading: IconButton(
                onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
            actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProductInfo(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "3 items",
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const ItemsList(),
                  const Text(
                    "Order information",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const InfoRow(
                      description:
                      "Q block,Lahore House No 35 Street 5,", //House No 35 Street 5,
                      title: "Shipping address"),
                  const InfoRow(
                      description: "**** *** *** 432", title: "Payment method "),
                  const InfoRow(
                      description: "Fedx,3 days left,34\$",
                      title: "Delivery method"),
                  const InfoRow(
                      description: "20% personal promo code", title: "Discount"),
                  const InfoRow(description: "765\$", title: "Total amount"),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            // backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: const BorderSide(color: Colors.black),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text("Recorder", style: TextStyle(fontSize: 14)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text("Leave feedback",
                                style: TextStyle(fontSize: 14)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Order №23548974",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                "01-02-2025",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: "Tracking Number: ",
                  style: TextStyle(color: Colors.grey)),
              TextSpan(
                  text: "982627923",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ])),
            Text(
              "Deliverd",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class ItemsList extends StatelessWidget {
  const ItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(3, (index) {
        return Container(
          height: 110,
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  "https://nakoosh.com/cdn/shop/files/NB-2782-Ivory-Long-Stitched-Dress-Nakoosh-Shop-2465.jpg?v=1696595079", // Placeholder image
                  width: 80,
                  // height: ,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Pullover",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text("Mango",
                        style: TextStyle(color: Colors.grey, fontSize: 14)),

                    Text("Color: Gray    Size: L",
                        style: TextStyle(color: Colors.grey, fontSize: 14)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Units: 1",
                            style: TextStyle(color: Colors.grey, fontSize: 14)),
                        Text("\$51",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String title;
  final String description;
  const InfoRow({super.key, required this.description, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.,
        children: [
          SizedBox(
            width: 150,
            child: Text(
              "$title:  ",
              style: const TextStyle(color: Colors.black38, fontSize: 16),
            ),
          ),
          SizedBox(
            width: 200,
            child: Text(
              description,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              // softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}