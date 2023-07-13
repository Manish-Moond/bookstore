// import 'package:bookstore/models/books_list_model.dart';
// import 'package:bookstore/repository/book_repository.dart';
// import 'package:bookstore/utils/constant.dart';
// import 'package:bookstore/view/widgets/book_card_widget.dart';
// import 'package:flutter/material.dart';

// class BooksListWidget extends StatefulWidget {
//   final String name;
//   const BooksListWidget({super.key, required this.name});

//   @override
//   State<BooksListWidget> createState() => _BooksListWidgetState();
// }

// class _BooksListWidgetState extends State<BooksListWidget> {
//   // HomeViewModel homeViewModel = HomeViewModel();
//   final ScrollController _scrollController = ScrollController();
//   final BookRepository bookRepository = BookRepository();
//   List<Books> books = [];
//   int sIndex = 1;
//   bool _isLoading = true;

//   void filler(value) {
//     setState(() {
//       books = [...books, ...value.books];
//       _isLoading = false;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     bookRepository
//         .fetchBooks(query: widget.name, startIndex: sIndex)
//         .then((value) => filler(value));
//     _scrollController.addListener(() async {
//       if (_scrollController.position.pixels ==
//           _scrollController.position.maxScrollExtent) {
//         sIndex += 20;
//         bookRepository
//             .fetchBooks(query: widget.name, startIndex: sIndex)
//             .then((value) => filler(value));
//         _isLoading = true;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.fromLTRB(20, 20, 23, 14),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 widget.name,
//                 style:
//                     const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//               ),
//               InkWell(
//                 onTap: () {
//                   // Navigator.pushNamed(context, RoutesName.booksGrid,
//                   //     arguments: books);
//                 },
//                 child: const Icon(
//                   Icons.arrow_forward,
//                   color: kPrimaryColor,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: 300,
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
//             child: SizedBox(
//                 height: 300,
//                 child: _isLoading
//                     ? const Center(child: CircularProgressIndicator())
//                     : ListView.builder(
//                         itemCount: books.length,
//                         controller: _scrollController,
//                         scrollDirection: Axis.horizontal,
//                         itemBuilder: (_, int index) {
//                           return BookCardWidget(
//                             book: books[index].bookInfo!,
//                           );
//                         },
//                       )),
//           ),
//         )
//       ],
//     );
//   }
// }

// import 'package:bookstore/config/routes/routes_name.dart';
// import 'package:bookstore/core/enums/data_state.dart';
// import 'package:bookstore/models/books_list_model.dart';
// import 'package:bookstore/utils/constant.dart';
// import 'package:bookstore/view/widgets/book_card_widget.dart';
// import 'package:bookstore/view_model/home_view_model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class BooksListWidget extends StatefulWidget {
//   final String name;
//   const BooksListWidget({Key? key, required this.name}) : super(key: key);

//   @override
//   State<BooksListWidget> createState() => _BooksListWidgetState();
// }

// class _BooksListWidgetState extends State<BooksListWidget> {
//   HomeViewModel homeViewModel = HomeViewModel();
//   List<Books> books = [];

//   @override
//   void initState() {
//     super.initState();
//     homeViewModel.fetchBooksList(widget.name);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.fromLTRB(20, 20, 20, 14),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 widget.name,
//                 style:
//                     const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//               ),
//               InkWell(
//                 onTap: () {
//                   Navigator.pushNamed(context, RoutesName.booksGrid,
//                       arguments: books);
//                 },
//                 child: const Icon(
//                   Icons.arrow_forward,
//                   color: kPrimaryColor,
//                 ),
//               )
//             ],
//           ),
//         ),
//         SizedBox(
//           height: 300,
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
//             child: ChangeNotifierProvider(
//               create: (context) => homeViewModel,
//               child: Consumer<HomeViewModel>(
//                 builder: (context, value, _) {
//                   // switch (homeViewModel.booksList.status) {
//                   switch (homeViewModel.dataState) {
//                     // case DataState.Uninitialized:
//                     // return BooksListViewWidget(
//                     //   // books: value.booksList.data!.books!,
//                     //   homeViewModel: homeViewModel,
//                     //   name: widget.name,
//                     //   isLoading: false,
//                     // );
//                     case DataState.FETCHING:
//                       return const Center(child: CircularProgressIndicator());
//                     case DataState.Uninitialized:
//                     case DataState.Initial_Fetching:
//                     case DataState.More_Fetching:
//                     case DataState.No_More_Data:
//                     case DataState.Error:
//                       return const Text("Error");
//                     case DataState.Refreshing:
//                     case DataState.Fetched:
//                       // var books = value.booksList.data!.books;
//                       // var books = value.dataList;
//                       return BooksListViewWidget(
//                         homeViewModel: homeViewModel,
//                         name: widget.name,
//                         isLoading: false,
//                       );
//                     // default:
//                     //   return const Text("data");
//                   }
//                 },
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// // ignore: must_be_immutable
// class BooksListViewWidget extends StatelessWidget {
//   HomeViewModel homeViewModel;
//   String name;
//   bool isLoading;

//   BooksListViewWidget({
//     super.key,
//     required this.homeViewModel,
//     required this.name,
//     required this.isLoading,
//   });

//   // @override
//   @override
//   Widget build(BuildContext context) {
//     List<Books> books = homeViewModel.dataList;
//     DataState status = homeViewModel.dataState;
//     // _books = homeViewModel.dataList;

//     // _status = homeViewModel.booksList.status!;
//     // _books = homeViewModel.booksList.data!.books!;
//     bool scrollNotification(ScrollNotification scrollInfo) {
//       if (!isLoading &&
//           scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
//         isLoading = true;
//         // Provider.of<HomeViewModel>(context).fetchBooksList(name);
//         homeViewModel.fetchBooksList(name);
//       }
//       return true;
//     }

//     return Column(
//       children: [
//         isLoading
//             ? const CircularProgressIndicator()
//             : Expanded(
//                 child: NotificationListener<ScrollNotification>(
//                   onNotification: scrollNotification,
//                   child: ListView.builder(
//                       // controller: _scrollController,
//                       scrollDirection: Axis.horizontal,
//                       itemCount: books.length,
//                       itemBuilder: (_, int index) {
//                         return BookCardWidget(book: books[index].bookInfo!);
//                       }),
//                 ),
//               ),
//         // if (status == DataState.More_Fetching)
//         //   const Center(child: CircularProgressIndicator()),
//       ],
//     );
//   }
// }

import 'package:bookstore/core/enums/data_state.dart';
import 'package:bookstore/models/books_list_model.dart';
import 'package:bookstore/utils/constant.dart';
import 'package:bookstore/view/books_grid_view.dart';
import 'package:bookstore/view/widgets/book_card_widget.dart';
import 'package:bookstore/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class BooksListWidget extends StatelessWidget {
  String name;
  int index;
  BooksListWidget({super.key, required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              InkWell(
                onTap: () {
                  // Navigator.of(context)
                  //     .pushNamed(RoutesName.booksGrid, arguments: {
                  //   "data": Provider.of<HomeViewModel>(context, listen: false)
                  //       .dataList
                  // });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => BooksGridView(name: name)));
                },
                child: const Icon(
                  Icons.arrow_forward,
                  color: kPrimaryColor,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 300,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: ChangeNotifierProvider(
              create: (context) => HomeViewModel(),
              child: Consumer<HomeViewModel>(builder:
                  (BuildContext context, HomeViewModel controller, Widget? _) {
                switch (controller.dataState) {
                  case DataState.Uninitialized:
                    Future(() {
                      controller.fetchData(name);
                    });
                    return const Center(child: CircularProgressIndicator());
                  case DataState.Initial_Fetching:
                    return const Center(child: CircularProgressIndicator());
                  case DataState.More_Fetching:
                  case DataState.Refreshing:
                    return BooksListViewWidget(name, controller.dataList, true);
                  case DataState.Fetched:
                    return BooksListViewWidget(
                        name, controller.dataList, false);
                  case DataState.Error:
                  case DataState.No_More_Data:
                    return BooksListViewWidget(
                        name, controller.dataList, false);
                }
              }),
            ),
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class BooksListViewWidget extends StatelessWidget {
  String name;
  final List<Books> _data;
  bool _isLoading;
  BooksListViewWidget(this.name, this._data, this._isLoading, {super.key});
  late DataState _dataState;
  late BuildContext _buildContext;
  @override
  Widget build(BuildContext context) {
    _dataState = Provider.of<HomeViewModel>(context, listen: false).dataState;
    _buildContext = context;
    return SafeArea(child: _scrollNotificationWidget());
  }

  Widget _scrollNotificationWidget() {
    return Row(
      children: [
        Expanded(
            child: NotificationListener<ScrollNotification>(
                onNotification: _scrollNotification,
                child: RefreshIndicator(
                  onRefresh: () async {
                    await _onRefresh();
                  },
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _data.length,
                    itemBuilder: (context, index) {
                      return BookCardWidget(
                        id: _data[index].id!,
                        bookInfo: _data[index].bookInfo!,
                      );
                    },
                  ),
                ))),
        if (_dataState == DataState.More_Fetching)
          const Center(child: CircularProgressIndicator()),
      ],
    );
  }

  bool _scrollNotification(ScrollNotification scrollInfo) {
    if (!_isLoading &&
        scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
      _isLoading = true;
      Provider.of<HomeViewModel>(_buildContext, listen: false).fetchData(name);
    }
    return true;
  }

  _onRefresh() async {
    if (!_isLoading) {
      _isLoading = true;
      Provider.of<HomeViewModel>(_buildContext, listen: false)
          .fetchData(name, isRefresh: true);
    }
  }
}
