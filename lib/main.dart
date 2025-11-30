import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'router/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const KindnessWallApp());
}

class KindnessWallApp extends StatelessWidget {
  const KindnessWallApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kindness Wall',
      theme: AppTheme.light(),
      initialRoute: AppRouter.initialRoute,   // 👈 starts at Welcome
      routes: AppRouter.routes,               // 👈 all routes wired here
      debugShowCheckedModeBanner: false,
    );
  }
}