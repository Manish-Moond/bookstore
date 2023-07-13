import 'package:bookstore/data/network/base_api_services.dart';
import 'package:bookstore/data/network/network_api_services.dart';
import 'package:bookstore/res/app_urls.dart';

class AuthRepository {
  BaseApiServices apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await apiServices.getPostApiResponse(AppUrl.loginEndPint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response = await apiServices.getPostApiResponse(
          AppUrl.registerApiEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
