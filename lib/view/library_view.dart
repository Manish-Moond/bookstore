import 'package:bookstore/utils/constant.dart';
import 'package:bookstore/view_model/book_view_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LibraryView extends StatelessWidget {
  LibraryView({Key? key}) : super(key: key);
  BookViewModel bookViewModel = BookViewModel();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Library"),
      ),
      body: Column(
        children: [
           // Fetch books using FutureBuilder
          FutureBuilder(
              future: bookViewModel.getBook(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) {
                          var book = snapshot.data![index];
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Container(
                                color: Colors.grey[100],
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Display book cover image
                                    SizedBox(
                                      height: 120,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          book.imageLinks == null
                                              ? "https://booksInfo.google.com/booksInfo/content?id=EVePnEaV368C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
                                              : book.imageLinks!.thumbnail!,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            // Handle the error case
                                            return const Icon(Icons.error);
                                          },
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          30, 12, 0, 12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            // height: 30,
                                            width: size.width * 0.5,
                                            child: Flexible(
                                              child: Text(
                                                book.title!,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ),
                                          Text("${book.publisher}"),
                                          Text(
                                            "Page: ${book.pageCount!}",
                                            style: const TextStyle(
                                                color: kGreyText,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  );
                } else if (snapshot.hasError) {
                  // Display message when there are no saved books
                  return const Text("No booked saved");
                } else {
                  // Display a loading spinner while books are being fetched
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ],
      ),
    );
  }
}
