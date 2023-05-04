// import 'package:flutter/material.dart';
// import 'book.dart';
// import 'book_card.dart';
// import 'book_service.dart';
//
// class BookSearchScreen extends StatefulWidget {
//   @override
//   _BookSearchScreenState createState() => _BookSearchScreenState();
// }
//
// class _BookSearchScreenState extends State<BookSearchScreen> {
//   final _searchController = TextEditingController();
//   List<Book> _books = [];
//
//   void _performSearch(String query) async {
//     final books = await BookService.searchBooks(query);
//     setState(() {
//       _books = books;
//     });
//   }
//   int _selectedIndex = 0;
//
//   static const List<Widget> _widgetOptions = <Widget>[
//
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: TextField(
//           controller: _searchController,
//           decoration: InputDecoration(
//             hintText: 'Search books',
//             border: InputBorder.none,
//             suffixIcon: IconButton(
//               icon: Icon(Icons.search),
//               onPressed: () => _performSearch(_searchController.text),
//             ),
//           ),
//           onSubmitted: (query) => _performSearch(query),
//         ),
//       ),
//       body:
//       ListView.builder(
//         itemCount: _books.length,
//         itemBuilder: (context, index) => BookCard(book: _books[index]),
//       ),
//
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'book.dart';
import 'book_card.dart';
import 'book_service.dart';
import 'notification_service.dart';

class BookSearchScreen extends StatefulWidget {
  @override
  _BookSearchScreenState createState() => _BookSearchScreenState();
}

class _BookSearchScreenState extends State<BookSearchScreen> {
  final _searchController = TextEditingController();
  List<Book> _books = [];

  void _performSearch(String query) async {
    final books = await BookService.searchBooks(query);
    setState(() {
      _books = books;
    });
  }
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search books',
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () => _performSearch(_searchController.text),
            ),
          ),
          onSubmitted: (query) => _performSearch(query),
        ),
      ),
      body: ListView.builder(
        itemCount: _books.length,
        itemBuilder: (context, index) => BookCard(book: _books[index]),
      ),
    );
  }
}
