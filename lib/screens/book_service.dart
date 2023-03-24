import 'dart:convert';
import 'package:http/http.dart' as http;

import 'book.dart';

class BookService {
  static const _baseUrl = 'https://www.googleapis.com/books/v1/volumes';

  static Future<List<Book>> searchBooks(String query) async {
    final url = Uri.parse('$_baseUrl?q=$query');
    final response = await http.get(url);
    final data = jsonDecode(response.body);

    final books = List<Book>.from(
      data['items'].map((bookData) => Book(
        title: bookData['volumeInfo']['title'],
        author: bookData['volumeInfo']['authors']?.join(', ') ?? '',
        description: bookData['volumeInfo']['description'] ?? '',
        thumbnailUrl: bookData['volumeInfo']['imageLinks']['thumbnail'] ?? '',
        previewLink: bookData['volumeInfo']['previewLinks'] ?? '',
        summary: bookData['volumeInfo']['summary'] ?? '',
      )),
    );

    return books;
  }
}
