import 'package:coffee_shop/componenst/addcoffee.dart';
import 'package:coffee_shop/theme/colors.dart';
import 'package:flutter/material.dart';

class Coffeetile extends StatelessWidget {
  const Coffeetile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 600;
    final iconSize = isSmallScreen ? 17.0 : 35.0;
    final paddingSize = isSmallScreen ? 10.0 : 15.0;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ThemeColors().background,
      ),
      width: 160,
      margin: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(paddingSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              barrierDismissible: true,
                              useSafeArea: true,
                              context: context,
                              builder: (context) => Addcoffee(),
                            );
                          },
                          child: Image.asset(
                            'assets/images/cappuccino.avif',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 50,
                          height: 26,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.star,
                                color: const Color.fromARGB(255, 237, 213, 0),
                                size: iconSize,
                              ),
                              const Text(
                                "4.5",
                                style: TextStyle(
                                  fontFamily: "Raleway",
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "Cappuccino",
                    style: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "With Oat Milk",
                    style: TextStyle(fontFamily: "Raleway", fontSize: 13),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${4.5}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: ThemeColors().primaryColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        style: IconButton.styleFrom(
                          backgroundColor: ThemeColors().primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        icon: const Icon(Icons.add),
                      ),
                    ],
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
