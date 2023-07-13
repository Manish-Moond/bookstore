import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BooksGridView extends StatelessWidget {
  String name;
  BooksGridView({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          mainAxisSpacing: 10.0, // Spacing between rows
          crossAxisSpacing: 10.0,
        ),
        itemBuilder: (context, index) {
          return null;
          // return BookCardWidget(book: arguments);
        },
      ),
    );
  }
}
