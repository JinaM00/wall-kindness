import 'package:flutter/material.dart';

class UpliftScreen extends StatelessWidget {
  const UpliftScreen({super.key});

  static const images = [
    'assets/images/uplift1.png',
    'assets/images/uplift2.png',
    'assets/images/uplift3.png',
    'assets/images/uplift4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Uplift Gallery')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12,
        ),
        itemCount: images.length,
        itemBuilder: (_, i) => ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(images[i], fit: BoxFit.cover),
        ),
      ),
    );
  }
}