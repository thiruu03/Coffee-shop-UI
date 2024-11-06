import 'package:coffee_shop/screens/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:coffee_shop/theme/colors.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ThemeColors().primaryColor,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Image
            LottieBuilder.asset('assets/images/lottie2.json'),

            const SizedBox(height: 20),

            // Intro Text
            const Text(
              "Welcome to Coffee Bliss",
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ).animate().fadeIn(duration: 800.ms).slide(begin: Offset(0, -0.3)),

            const SizedBox(height: 10),

            // Description Text
            const Text(
              "Discover the finest coffee curated for you",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 16,
                color: Colors.white70,
              ),
            ).animate().fadeIn(duration: 800.ms).slide(begin: Offset(0, -0.2)),

            const SizedBox(height: 30),

            // Get Started Button
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Mainscreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                "Get Started",
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color:
                      Color.fromARGB(255, 255, 76, 16), // Match primary color
                ),
              ),
            ).animate().fadeIn(duration: 800.ms).slide(begin: Offset(0, 0.3)),
          ],
        ),
      ),
    );
  }
}
