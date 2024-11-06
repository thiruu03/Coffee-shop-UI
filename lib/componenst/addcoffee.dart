import 'package:coffee_shop/theme/colors.dart';
import 'package:flutter/material.dart';

class Addcoffee extends StatelessWidget {
  const Addcoffee({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width <= 600;
    final paddingSize = isSmallScreen ? 8.0 : 15.0;

    return AlertDialog(
      // Match with the app theme
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: SizedBox(
        height: 550,
        child: Padding(
          padding: EdgeInsets.all(paddingSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/cappuccino.avif',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Cappuccino With Oats Milk',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Cappuccino is a rich espresso-based drink topped with steamed milk and a thick layer of frothy milk foam. It's often enhanced with a sprinkle of cocoa or cinnamon for added flavor.",
                style: TextStyle(fontFamily: 'Raleway'),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: paddingSize * 4),
                      backgroundColor: ThemeColors().primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Order Now",
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          // Handle favorite action
                        },
                        style: IconButton.styleFrom(
                          backgroundColor: ThemeColors().primaryColor,
                        ),
                        icon: const Icon(Icons.favorite),
                      ),
                      IconButton(
                        onPressed: () {
                          // Handle share action
                        },
                        style: IconButton.styleFrom(
                          backgroundColor: ThemeColors().primaryColor,
                        ),
                        icon: const Icon(Icons.share),
                      ),
                    ],
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

// To show the dialog, use this code in your main widget or wherever appropriate:
void showAddcoffee(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const Addcoffee(),
  );
}
