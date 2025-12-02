import 'package:flutter/material.dart';
import '../../../router/app_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50], // 👈 pastel light pink background
      appBar: AppBar(
        title: const Text('Welcome'),
        backgroundColor: Colors.pink[200], // optional: pastel AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 👇 Add your image here
            Image.asset(
              'assets/icons/sticker1.png', // <-- path to your image in assets
              height: 200,
            ),
            const SizedBox(height: 20),

            const Text(
              'Welcome to Kindness Wall 💌💕🌸',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[300], // 👈 pastel button color
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  AppRouter.routeWall,
                  arguments: 'guest',
                );
              },
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}