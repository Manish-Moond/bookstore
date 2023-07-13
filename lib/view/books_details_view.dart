import 'package:bookstore/models/books_list_model.dart';
import 'package:bookstore/utils/constant.dart';
import 'package:bookstore/view_model/book_view_model.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BooksDetailsView extends StatelessWidget {
  final BookInfo book;

  BooksDetailsView({super.key, required this.book});
  BookViewModel bookViewModel = BookViewModel();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.all(8),
            child: Icon(Icons.add),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(12, 0, 20, 0),
            child: Icon(Icons.share),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Book details section
              SizedBox(
                height: 250,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        book.imageLinks == null
                            ? "https://books.google.com/books/content?id=EVePnEaV368C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
                            : book.imageLinks!.thumbnail!,
                        errorBuilder: (context, error, stackTrace) {
                          // Handle the error case
                          return const Icon(Icons.error);
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: size.width * 0.40,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  book.title!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                            width: size.width * 0.4,
                            child: Row(
                              children: [
                                Expanded(child: Text(book.publisher!)),
                              ],
                            )),
                        const SizedBox(height: 8),
                        Text(
                          "Released Date: ${book.publishedDate!}",
                          style: const TextStyle(color: kGreyText),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Ratings, Book Type, Page Count
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "${book.averageRating}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.star, color: kGreyText),
                        ],
                      ),
                      Text(
                        "${book.ratingsCount} reviews",
                        style: const TextStyle(color: kGreyText),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                    child: VerticalDivider(
                      color: kGreyText,
                    ),
                  ),
                  const Column(
                    children: [
                      Icon(
                        Icons.book,
                        color: kGreyText,
                      ),
                      Text("Ebook"),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                    child: VerticalDivider(
                      color: kGreyText,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "${book.pageCount}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const Text("pages")
                    ],
                  )
                ],
              ),
              const SizedBox(height: 12),
              // Buttons
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            fixedSize: const Size(130, 20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        child: const Text("Read"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          bookViewModel.saveBook(book);
                        },
                        style: OutlinedButton.styleFrom(
                            fixedSize: const Size(130, 20),
                            foregroundColor: kPrimaryColor,
                            backgroundColor: kPrimaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        child: const Text(
                          "Save Book",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(300, 20),
                        foregroundColor: kPrimaryColor,
                        backgroundColor: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    onPressed: () {
                      bookViewModel.saveBookToserver(book);
                    },
                    child: const Text(
                      "Add to wishlist",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(
                thickness: 1,
                height: 20,
              ),
              const SizedBox(height: 20),
              const Text(
                "About this book",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              const SizedBox(height: 8),
              ExpandableText(
                book.description!,
                expandText: 'show more',
                collapseText: 'show less',
                linkColor: kPrimaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
