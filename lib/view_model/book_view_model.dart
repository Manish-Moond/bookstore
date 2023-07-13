import 'dart:convert';

import 'package:bookstore/models/books_list_model.dart';
import 'package:bookstore/repository/book_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookViewModel {
  Future<void> saveBook(BookInfo book) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    List<String> blist = sp.getStringList("book") ?? [];
    blist.add(jsonEncode(book.toJson()));
    sp.setStringList("book", blist);
  }

  Future<List<BookInfo>> getBook() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    List<String> blist = sp.getStringList("book") ?? [];
    List<BookInfo> lst =
        blist.map((item) => BookInfo.fromJson(json.decode(item))).toList();
    return lst;
  }

  Future<void> saveBookToserver(BookInfo data) async {
    final bookRepo = BookRepository();
    try {
      bookRepo.saveBooks(jsonEncode(data.toJson()));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
