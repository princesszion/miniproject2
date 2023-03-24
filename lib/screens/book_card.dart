import 'package:flutter/material.dart';
import 'book.dart';

class BookCard extends StatelessWidget {
  final Book book;

  BookCard({required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookSummaryScreen(book: book),
            ),
          );
        },
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookSummaryScreen(book: book),
                      ),
                    );
                  },
                  child: Text(
                    book.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 72.0,
              height: 108.0,
              child: book.thumbnailUrl.isNotEmpty
                  ? Image.network(book.thumbnailUrl)
                  : Placeholder(),
            ),
          ],
        ),
      ),
    );
  }
}

class BookSummaryScreen extends StatelessWidget {
  final Book book;

  BookSummaryScreen({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              book.title,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 8.0),
            Text(
              book.author,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 16.0),
            Text(
              book.summary,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              book.thumbnailUrl,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
