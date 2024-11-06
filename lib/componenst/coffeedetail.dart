import 'package:coffee_shop/theme/colors.dart';
import 'package:flutter/material.dart';

class Coffeedetail extends StatelessWidget {
  const Coffeedetail({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width <= 600;
    final paddingSize = isSmallScreen ? 13.0 : 15.0;
    return Container(
      margin: EdgeInsets.all(paddingSize).copyWith(bottom: 0),
      decoration: BoxDecoration(
        color: ThemeColors().background,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(paddingSize),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/cappuccino.avif',
                height: 120,
              ),
            ),
            const Text(
              '5 Coffee Beens You\n Must Try!',
              style: TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            )
          ],
        ),
      ),
    );
  }
}
