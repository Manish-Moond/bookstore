import 'package:bookstore/config/routes/routes_name.dart';
import 'package:bookstore/models/books_list_model.dart';
import 'package:flutter/material.dart';

class BookCardWidget extends StatelessWidget {
  final BookInfo bookInfo;
  final String id;
  const BookCardWidget({Key? key, required this.bookInfo, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Book book = Book(id: id, bookInfo: bookInfo);
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(RoutesName.details, arguments: bookInfo);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
        child: SizedBox(
          width: 160,
          child: Column(
            children: [
              SizedBox(
                height: 240,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    bookInfo.imageLinks == null
                        ? "https://booksInfo.google.com/booksInfo/content?id=EVePnEaV368C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
                        : bookInfo.imageLinks!.thumbnail!,
                    errorBuilder: (context, error, stackTrace) {
                      // Handle the error case
                      return const Icon(Icons.error);
                    },
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
                child: Text(
                  "${bookInfo.title}",
                  style: const TextStyle(fontSize: 11),
                ),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Text(bookInfo.averageRating.toString()),
                      const Icon(
                        Icons.star,
                        size: 14,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
