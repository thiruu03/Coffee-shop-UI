import 'package:coffee_shop/screens/cofeelists.dart';
import 'package:coffee_shop/screens/favourites.dart';
import 'package:coffee_shop/screens/notifications.dart';
import 'package:coffee_shop/screens/ordersscreen.dart';
import 'package:coffee_shop/theme/colors.dart';
import 'package:flutter/material.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  int index = 0;
  List<String> titles = ["", "Orders", "Favourites", "Track Orders"];
  late PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: index);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width <= 600;
    final iconSize = isSmallScreen ? 25.0 : 35.0;
    final paddingSize = isSmallScreen ? 13.0 : 15.0;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          titles[index],
          style: const TextStyle(fontFamily: "Raleway"),
        ),
        centerTitle: true,
        scrolledUnderElevation: 0.0,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: paddingSize),
          child: IconButton(
            icon: const Icon(
              Icons.grid_view_rounded,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                backgroundColor: Colors.black,
                child: Image.asset(
                  'assets/images/profile.png',
                  height: 55,
                ),
              ),
            ),
          ),
        ],
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (value) {
          setState(() {
            index = value;
          });
        },
        children: const [
          Cofeelists(),
          Ordersscreen(),
          Favourites(),
          Notifications(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        unselectedItemColor: Colors.grey[700],
        selectedItemColor: ThemeColors().primaryColor,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.shifting,
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
          pageController.animateToPage(
            value,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: paddingSize),
                child: Icon(
                  Icons.home_filled,
                  size: iconSize,
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: paddingSize),
                child: Icon(
                  Icons.shopping_bag,
                  size: iconSize,
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: paddingSize),
                child: Icon(
                  Icons.favorite,
                  size: iconSize,
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: paddingSize),
                child: Icon(
                  Icons.notifications_sharp,
                  size: iconSize,
                ),
              ),
              label: ''),
        ],
      ),
    );
  }
}
