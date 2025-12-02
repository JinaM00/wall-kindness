import 'package:flutter/material.dart';
import '../../../router/app_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 24),

            // 👇 Add your ElevatedButton here
            ElevatedButton(
              onPressed: () {
                // Navigate to Wall after login
                Navigator.pushReplacementNamed(
                  context,
                  AppRouter.routeWall,
                  arguments: usernameController.text.isNotEmpty
                      ? usernameController.text
                      : 'guest',
                );
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}