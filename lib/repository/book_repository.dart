import 'package:bookstore/data/network/base_api_services.dart';
import 'package:bookstore/data/network/network_api_services.dart';
import 'package:bookstore/models/books_list_model.dart';
import 'package:bookstore/res/app_urls.dart';

class BookRepository {
  BaseApiServices apiServices = NetworkApiService();

  Future<dynamic> fetchBooks(
      {String query = "search-terms", int startIndex = 1}) async {
    try {
      print("Called");
      dynamic response = await apiServices.getGetApiResponse(
          '${AppUrl.bookBaseUrl}${AppUrl.query}$query${AppUrl.maxResult}${AppUrl.startIndex}$startIndex${AppUrl.apiKey}');
      return response = BooksListModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> saveBooks(dynamic data) async {
    dynamic res = await apiServices.getPostApiResponse(
        "http://localhost:8000/postbook", data);
    return res;
  }
}
