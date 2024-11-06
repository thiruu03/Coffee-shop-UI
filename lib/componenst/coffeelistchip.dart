import 'package:coffee_shop/theme/colors.dart';
import 'package:flutter/material.dart';

class Coffeelistchip extends StatefulWidget {
  const Coffeelistchip({
    super.key,
  });

  @override
  State<Coffeelistchip> createState() => _CoffeelistchipState();
}

int selectedIndex = 0;

class _CoffeelistchipState extends State<Coffeelistchip> {
  @override
  Widget build(BuildContext context) {
    List<String> coffee = ["Cappuccino", "Expresso", "Latte", "Black Coffee"];
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: coffee.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Column(
                children: [
                  Chip(
                    labelStyle: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        fontSize: selectedIndex == index ? 19 : 17,
                        color: selectedIndex == index
                            ? ThemeColors().primaryColor
                            : Colors.white),
                    side: BorderSide.none,
                    label: Text(coffee[index]),
                  ),
                  selectedIndex == index
                      ? Container(
                          margin: const EdgeInsets.only(top: 4),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: ThemeColors().primaryColor,
                            shape: BoxShape.circle,
                          ))
                      : Container(
                          height: 0,
                        )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
