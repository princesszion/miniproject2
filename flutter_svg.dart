import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'lib/screens/book.dart';

class BookCard extends StatelessWidget {
  final Book book;

  BookCard({required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            child: Padding(
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
                ],
              ),
            ),
          ),
          SvgPicture.network(
            book.thumbnailUrl,
            width: 72.0,
          ),
        ],
      ),
    );
  }
}
