// // import 'package:flutter/cupertino.dart';
// // import 'package:mvvm/data/response/api_response.dart';
// // import 'package:mvvm/model/movies_model.dart';
// // import 'package:mvvm/respository/home_repository.dart';

// import 'package:bookstore/core/enums/data_state.dart';
// import 'package:bookstore/models/books_list_model.dart';
// import 'package:bookstore/repository/book_repository.dart';
// import 'package:flutter/material.dart';

// class HomeViewModel with ChangeNotifier {
//   final bookRepo = BookRepository();
//   // ApiResponse<BooksListModel> booksList = ApiResponse.fetching();
//   // List<Books> booksList = [];
//   // List<Books> get getBooksList => booksList;
//   DataState dataState = DataState.Uninitialized;
//   // DataState get getDataState => dataState; // getters of State of Data
//   List<Books> dataList = []; // List Containing the data
//   // List<BooksListModel> get getDataList => dataList;
//   int currentPageNumber = 1;

//   // setBooksList(ApiResponse<BooksListModel> response) {
//   // booksList = response;
//   //
//   // }

//   Future<void> fetchBooksList(String query) async {
//     dataState = DataState.FETCHING;
//     notifyListeners();
//     // setBooksList(ApiResponse.fetching());
//     // bookRepo
//     //     .fetchBooks(query: query, startIndex: startIndex)
//     //     .then((value) => setBooksList(ApiResponse.fetched(value)))
//     //     .onError((error, stackTrace) =>
//     //         setBooksList(ApiResponse.error(error.toString())));

//     if (currentPageNumber > 1) {
//       // setBooksList(ApiResponse.moreFetcing());
//       dataState = DataState.More_Fetching;
//       notifyListeners();
//     }
//     try {
//       final response = await bookRepo.fetchBooks(
//           query: query, startIndex: currentPageNumber);
//       dataList += response.books;
//       // if (currentPageNumber <= 1) {
//         dataState = DataState.Fetched;
//       // }
//       // else{
//       //   dataState.
//       // }
//       currentPageNumber += 20;
//       notifyListeners();
//       // setBooksList(ApiResponse.fetched(response));
//     } catch (e) {
//       // setBooksList(ApiResponse.error(e.toString()));
//       dataState = DataState.Error;
//       print(e.toString());
//       notifyListeners();
//     }
//   }
// }

// // This class is extended by ChangeNotifier
// // Since we will be notifying the Consumers or Listening widgets
// class ListController extends ChangeNotifier {
//   int _currentPageNumber = 0; // Current Page to get Data from API
//   final int _totalPages = 5; // Total Pages of Data from API
//   DataState _dataState = DataState
//       .Uninitialized; // Current State of Data. Initially it will be UnInitialized
//   bool get _didLastLoad =>
//       _currentPageNumber >=
//       _totalPages; // Property through which we can check if last page have been loaded from API or not
//   DataState get dataState => _dataState; // getters of State of Data
//   List<String> _dataList = []; // List Containing the data
//   List<String> get dataList => _dataList; // getters of List of Data

//   // Method to Fetch Data, I will explain it below the code
//   fetchData({bool isRefresh = false}) async {
//     if (!isRefresh) {
//       _dataState = (_dataState == DataState.Uninitialized)
//           ? DataState.Initial_Fetching
//           : DataState.More_Fetching;
//     } else {
//       _dataList.clear();
//       _currentPageNumber = 0;
//       _dataState = DataState.Refreshing;
//     }
//     notifyListeners();
//     try {
//       if (_didLastLoad) {
//         _dataState = DataState.No_More_Data;
//       } else {
//         List<String> list =
//             await BookRepository().fetchBooks(query: "", startIndex: 1);
//         _dataList += list;
//         _dataState = DataState.Fetched;
//         _currentPageNumber += 1;
//       }
//       notifyListeners();
//     } catch (e) {
//       _dataState = DataState.Error;
//       notifyListeners();
//     }
//   }
// }

// // class HomeViewViewModel  with ChangeNotifier{
// //   final _myRepo = HomeRepository();

// //   ApiResponse<MovieListModel> moviesList = ApiResponse.loading();

// //   setMoviesList(ApiResponse<MovieListModel> response) {
// //     moviesList = response;
// //     notifyListeners();
// //   }

// //   Future<void> fetchMoviesListApi() async {
// //     setMoviesList(ApiResponse.loading());

// //     _myRepo.fetchMoviesList().then((value) {
// //       setMoviesList(ApiResponse.completed(value));
// //     }).onError((error, stackTrace) {
// //       setMoviesList(ApiResponse.error(error.toString()));
// //     });
// //   }
// // }

import 'package:bookstore/core/enums/data_state.dart';
import 'package:bookstore/models/books_list_model.dart';
import 'package:bookstore/repository/book_repository.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final bookRepo = BookRepository();
  int sIndex = 0;
  DataState _dataState = DataState.Uninitialized;
  DataState get dataState => _dataState;
  List<Books> _dataList = [];
  List<Books> get dataList => _dataList;

  fetchData(String query, {bool isRefresh = false}) async {
    if (!isRefresh) {
      _dataState = (_dataState == DataState.Uninitialized)
          ? DataState.Initial_Fetching
          : DataState.More_Fetching;
    } else {
      _dataList.clear();
      sIndex = 0;
      _dataState = DataState.Refreshing;
    }
    notifyListeners();
    try {
      bookRepo.fetchBooks(query: query, startIndex: sIndex).then((value) {
        _dataList += value.books;
        _dataState = DataState.Fetched;
        sIndex += 5;
        notifyListeners();
      });
    } catch (e) {
      _dataState = DataState.Error;
      notifyListeners();
    }
  }
}
