import 'package:flutter/material.dart';

class MyOrders extends StatelessWidget {
  MyOrders({super.key});

  final int selectedTabIndex = 0;

  final List<String> tabs = ["Delivered", "Processing", "Cancelled"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF9F9F9),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search))
                ],
              ),
              const Text(
                "My Orders",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
              TabSelector(
                tabs: tabs,
                selectedIndex: selectedTabIndex,
                onTabSelected: (index) {},
              ),
              if (selectedTabIndex == 0)
                Expanded(
                  child: ListView(
                    children: const [
                      OrderCard(
                          orderNumber: "12442",
                          date: "01-02-2025",
                          trackingNumber: "imv#235236",
                          quantity: "2",
                          totalAmount: "24",
                          status: "Delivered",
                      ),
                      OrderCard(
                          orderNumber: "12442",
                          date: "01-02-2025",
                          trackingNumber: "imv#235236",
                          quantity: "2",
                          totalAmount: "24",
                          status: "Delivered",
                      ),
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class TabSelector extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const TabSelector({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        tabs.length,
        (index) => GestureDetector(
          onTap: () => onTabSelected(index),
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 7.0, horizontal: 18.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: selectedIndex == index ? Colors.black : Colors.white,
            ),
            child: Text(
              tabs[index],
              style: TextStyle(
                color: selectedIndex == index ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  const OrderCard({super.key,
    required this.orderNumber,
    required this.date,
    required this.trackingNumber,
    required this.quantity,
    required this.totalAmount,
    required this.status,
  });

  final String orderNumber;
  final String date;
  final String trackingNumber;
  final String quantity;
  final String totalAmount;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.only(bottom: 16.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Order №$orderNumber",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    date,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Text.rich(TextSpan(children: [
                const TextSpan(
                    text: "Tracking Number: ",
                    style: TextStyle(color: Colors.grey)),
                TextSpan(
                    text: trackingNumber,
                    style: const TextStyle(fontWeight: FontWeight.bold))
              ])),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(TextSpan(children: [
                    const TextSpan(
                        text: "Quantity:",
                        style: TextStyle(color: Colors.grey)),
                    TextSpan(
                        text: quantity,
                        style: const TextStyle(fontWeight: FontWeight.bold))
                  ])),
                  Text.rich(TextSpan(children: [
                    const TextSpan(
                        text: "Total Amount:",
                        style: TextStyle(color: Colors.grey)),
                    TextSpan(
                        text: "$totalAmount\$",
                        style: const TextStyle(fontWeight: FontWeight.bold))
                  ])),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.black),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "Details",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Text(
                    status,
                    style: TextStyle(
                      color: status == "Delivered"
                          ? Colors.green
                          : status == "Processing"
                              ? Colors.orange
                              : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
