import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:miniproject2/screens/book.dart';
import 'package:miniproject2/screens/book_card.dart';
import 'package:miniproject2/screens/book_search_screen.dart';
import 'package:miniproject2/screens/book_service.dart';
import 'package:miniproject2/screens/notification_service.dart';

void main() {
  testWidgets('Search text field is displayed', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: BookSearchScreen()));
    final hintTextFinder = find.text('Search books');
    final textFieldFinder = find.byType(TextField);
    final iconButtonFinder = find.byIcon(Icons.search);

    expect(hintTextFinder, findsOneWidget);
    expect(textFieldFinder, findsOneWidget);
    expect(iconButtonFinder, findsOneWidget);
  });

  testWidgets('Typing into search text field updates its value',
          (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(home: BookSearchScreen()));
        final textFieldFinder = find.byType(TextField);
        final searchQuery = 'Test query';

        await tester.enterText(textFieldFinder, searchQuery);
        expect(find.text(searchQuery), findsOneWidget);
      });
}