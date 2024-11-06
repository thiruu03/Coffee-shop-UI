import 'package:flutter/material.dart';

class Favourites extends StatefulWidget {
  const Favourites({super.key});

  @override
  State<Favourites> createState() => _FavouritesPageState();
}

final color = Colors.red;

class _FavouritesPageState extends State<Favourites> {
  // Sample list of favorite coffees, you can replace it with your actual data
  List<Map<String, dynamic>> favouriteCoffees = [
    {
      'name': 'Cappuccino',
      'description': 'With Oat Milk',
      'price': 4.5,
      'image': 'assets/images/cappuccino.avif'
    },
    {
      'name': 'Latte',
      'description': 'With Almond Milk',
      'price': 5.0,
      'image': 'assets/images/latte.webp'
    },
    {
      'name': 'Espresso',
      'description': 'Strong and Bold',
      'price': 3.5,
      'image': 'assets/images/expresso.avif'
    },
  ];

  void removeFavorite(int index) {
    setState(() {
      favouriteCoffees.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: favouriteCoffees.isEmpty
          ? Center(
              child: Text(
                "No favorites yet!",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[700],
                  fontFamily: "Raleway",
                ),
              ),
            )
          : ListView.builder(
              itemCount: favouriteCoffees.length,
              itemBuilder: (context, index) {
                final coffee = favouriteCoffees[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                      leading: Image.asset(
                        coffee['image'],
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        coffee['name'],
                        style: const TextStyle(
                          fontFamily: "Raleway",
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                        coffee['description'],
                        style: const TextStyle(
                            fontFamily: "Raleway", fontSize: 13),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.favorite, color: Colors.red),
                            onPressed: () {
                              setState(() {});
                            },
                          ),
                          IconButton(
                            onPressed: () => removeFavorite(index),
                            icon: const Icon(Icons.delete),
                          )
                        ],
                      )),
                );
              },
            ),
    );
  }
}
