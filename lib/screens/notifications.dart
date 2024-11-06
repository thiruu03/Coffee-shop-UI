import 'package:coffee_shop/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width <= 600;
    final paddingSize = isSmallScreen ? 8.0 : 15.0;

    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.all(paddingSize),
        itemCount: 4, // Replace with actual order count
        itemBuilder: (context, index) {
          return OrderNotificationTile(
            coffeeName: 'Cappuccino with Oat Milk', // Example coffee name
            coffeeImage:
                'assets/images/cappuccino.avif', // Example coffee image path
            orderNumber: 'Order #${index + 1}',
            onConfirmReceived: () {
              _showThankYouDialog(context);
            },
          );
        },
      ),
    );
  }

  void _showThankYouDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          alignment: Alignment.center,
          children: [
            LottieBuilder.asset('assets/images/lottie.json'),
            AlertDialog(
              title: const Text(
                "Thank You!",
                style: TextStyle(
                    fontFamily: 'Raleway', fontWeight: FontWeight.bold),
              ),
              content: const Text(
                "Thanks for confirming. We hope you enjoyed your coffee!",
                style: TextStyle(fontFamily: 'Raleway'),
              ),
              actions: [
                TextButton(
                  child: const Text(
                    "Close",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontFamily: 'Raleway'),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class OrderNotificationTile extends StatelessWidget {
  final String coffeeName;
  final String coffeeImage;
  final String orderNumber;
  final VoidCallback onConfirmReceived;

  const OrderNotificationTile({
    required this.coffeeName,
    required this.coffeeImage,
    required this.orderNumber,
    required this.onConfirmReceived,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width <= 600;
    final paddingSize = isSmallScreen ? 10.0 : 15.0;

    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: paddingSize),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(paddingSize),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                coffeeImage,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coffeeName,
                    style: const TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    orderNumber,
                    style: const TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Your order is on the way. Track and receive it soon!",
                    style: TextStyle(fontFamily: 'Raleway', fontSize: 15),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: onConfirmReceived,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeColors().primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Order Received",
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
