import 'package:bookstore/config/routes/routes_name.dart';
import 'package:bookstore/models/user_model.dart';
import 'package:bookstore/view_model/user_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SplashViewModel {
  Future<UserModel> getUserDate() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserDate().then((value) async {
      if (value.token.toString() == "null" || value.token.toString() == '') {
        await Future.delayed(const Duration(seconds: 1));
        Navigator.pushReplacementNamed(context, RoutesName.login);
      } else {
        await Future.delayed(const Duration(seconds: 1));
        Navigator.pushReplacementNamed(context, RoutesName.dashboard);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
