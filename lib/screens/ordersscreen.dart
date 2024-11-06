import 'package:flutter/material.dart';
import 'package:coffee_shop/theme/colors.dart';

class Ordersscreen extends StatefulWidget {
  const Ordersscreen({super.key});

  @override
  State<Ordersscreen> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<Ordersscreen> {
  final List<Map<String, dynamic>> _orders = [
    {
      "name": "Cappuccino",
      "price": 4.5,
      "quantity": 1,
      "image": "assets/images/cappuccino.avif"
    },
    {
      "name": "Espresso",
      "price": 3.0,
      "quantity": 2,
      "image": "assets/images/expresso.avif"
    },
    // Add more items here if needed
  ];

  void _increaseQuantity(int index) {
    setState(() {
      _orders[index]["quantity"] += 1;
    });
  }

  void _decreaseQuantity(int index) {
    setState(() {
      if (_orders[index]["quantity"] > 1) {
        _orders[index]["quantity"] -= 1;
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      _orders.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 600;
    final iconSize = isSmallScreen ? 25.0 : 35.0;
    final paddingSize = isSmallScreen ? 10.0 : 15.0;
    double totalPrice = _orders.fold(
        0, (sum, item) => sum + (item["price"] * item["quantity"]));

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _orders.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(paddingSize),
                  padding: EdgeInsets.all(paddingSize),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ThemeColors().background,
                  ),
                  child: Row(
                    children: [
                      // Image section
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          _orders[index]["image"],
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),

                      // Item details section
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _orders[index]["name"],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                                "\$${_orders[index]["price"].toStringAsFixed(2)}"),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.remove,
                                    size: iconSize,
                                  ),
                                  onPressed: () => _decreaseQuantity(index),
                                ),
                                Text(_orders[index]["quantity"].toString()),
                                IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    size: iconSize,
                                  ),
                                  onPressed: () => _increaseQuantity(index),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Remove button
                      IconButton(
                        icon: Icon(
                          Icons.delete,
                          size: iconSize,
                        ),
                        onPressed: () => _removeItem(index),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Total price and Confirm Order button
          Container(
            padding: EdgeInsets.all(paddingSize),
            decoration: const BoxDecoration(),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "\$${totalPrice.toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Implement the order confirmation action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeColors().primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Confirm Order",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Raleway'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
