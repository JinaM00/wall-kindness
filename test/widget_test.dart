import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kindness_wall/main.dart';

void main() {
  testWidgets('App loads login screen', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(const KindnessWallApp());

    // Verify login screen UI
    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
  });
}