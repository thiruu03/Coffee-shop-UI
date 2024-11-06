import 'package:coffee_shop/componenst/coffeedetail.dart';
import 'package:coffee_shop/componenst/coffeelistchip.dart';
import 'package:coffee_shop/componenst/coffeetile.dart';
import 'package:flutter/material.dart';

class Cofeelists extends StatefulWidget {
  const Cofeelists({super.key});

  @override
  State<Cofeelists> createState() => _CofeelistsState();
}

TextEditingController textEditingController = TextEditingController();

class _CofeelistsState extends State<Cofeelists>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _headerAnimation;
  late Animation<Offset> _searchBarAnimation;
  late Animation<Offset> _chipAnimation;
  late Animation<Offset> _horizontalListAnimation;
  late Animation<Offset> _verticalListAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize AnimationController
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    // Define Animations
    _headerAnimation =
        Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero).animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeInOutQuad));

    _searchBarAnimation = Tween<Offset>(
            begin: const Offset(1.0, 0.0), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _chipAnimation = Tween<Offset>(
            begin: const Offset(-1.0, 0.0), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _horizontalListAnimation = Tween<Offset>(
            begin: const Offset(1.0, 0.0), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _verticalListAnimation = Tween<Offset>(
            begin: const Offset(0.0, 1.0), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    // Start Animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width <= 600;
    final paddingSize = isSmallScreen ? 13.0 : 15.0;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Text with Slide-In Animation
          SlideTransition(
            position: _headerAnimation,
            child: Container(
              margin: EdgeInsets.all(paddingSize).copyWith(bottom: 10),
              child: const Text(
                "Find the best  \ncoffee for you",
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Search Bar with Slide-In Animation
          SlideTransition(
            position: _searchBarAnimation,
            child: Padding(
              padding: EdgeInsets.all(paddingSize),
              child: TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Find your coffee...',
                  hintStyle: TextStyle(fontFamily: 'Raleway'),
                  fillColor: Color.fromARGB(168, 36, 36, 36),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Coffee List Chip with Slide-In Animation
          SlideTransition(
            position: _chipAnimation,
            child: const Coffeelistchip(),
          ),
          const SizedBox(height: 10),

          // Scrollable Section
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Horizontal List of Coffee Tiles with Slide-In Animation
                  SlideTransition(
                    position: _horizontalListAnimation,
                    child: SizedBox(
                      height: 299,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return const Coffeetile();
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),

                  // Vertical List of Coffee Details with Slide-In Animation
                  SlideTransition(
                    position: _verticalListAnimation,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return const Coffeedetail();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
