import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:miniproject2/main.dart';
import 'package:miniproject2/screens/book_search_screen.dart';
import 'package:miniproject2/screens/settings.dart';
import 'package:miniproject2/screens/splash_screen.dart';
//import 'package:miniproject2/screens/login.dart';
import 'dart:ui' show lerpDouble;
import 'dart:ui' as ui;

void main() {
  testWidgets('HomePage renders correctly', (WidgetTester tester) async {
    // Build the widget tree
    await tester.pumpWidget(MaterialApp(home: HomePage()));

    // Verify that the widget appears as expected
    expect(find.text('Your One Stop For Book Search '), findsOneWidget);
    expect(find.byType(Image), findsNWidgets(4));
    expect(find.text('Imerserse Your Mind Into The World Of Literature'),
        findsOneWidget);
    expect(find.text('Your Favorite Books At Your Fingers'), findsOneWidget);
    expect(find.text('Take Notes And Jot Down Takeaways From Your Readings'),
        findsOneWidget);
    expect(
        find.text('Learning Never Ends So Read On The Goal'), findsOneWidget);
  });

  testWidgets('MyApp renders correctly', (WidgetTester tester) async {
    // Build the widget tree
    await tester.pumpWidget(MyApp());

    // Verify that the widget appears as expected
    expect(find.text('WORDSWORTH'), findsOneWidget);
    //expect(find.byType(String), findsOneWidget);
  });

  testWidgets('MainPage renders correctly', (WidgetTester tester) async {
    // Build the widget tree
    await tester.pumpWidget(
      MaterialApp(
        home: MainPage(),
      ),
    );

    // Verify that the widget appears as expected
    expect(find.text('WORDSWORTH'), findsOneWidget);
  });

  testWidgets('BookSearchScreen renders correctly',
          (WidgetTester tester) async {
        // Build the widget tree
        await tester.pumpWidget(MaterialApp(home: BookSearchScreen()));

        // Verify that the widget appears as expected
        expect(
            find.byWidgetPredicate((widget) =>
            widget is Text &&
                widget.data != null &&
                widget.data!.contains('Search books')),
            findsOneWidget);
      });

  testWidgets('Settings renders correctly', (WidgetTester tester) async {
    // Build the widget tree
    await tester.pumpWidget(MaterialApp(home: Settings()));

    // Verify that the widget appears as expected
    expect(find.text('Settings'), findsOneWidget);
    //expect(find.byType(SwitchListTile), findsNWidgets(2));
  });
}