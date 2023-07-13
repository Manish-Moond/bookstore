import 'package:bookstore/config/routes/routes_name.dart';
import 'package:bookstore/models/user_model.dart';
import 'package:bookstore/repository/auth_repository.dart';
import 'package:bookstore/utils/utils.dart';
import 'package:bookstore/view_model/user_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);

    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      final userPreference = Provider.of<UserViewModel>(context, listen: false);
      userPreference.saveUser(UserModel(token: value['token'].toString()));

      Utils.toastMessage('Login Successfully');
      Navigator.pushReplacementNamed(context, RoutesName.dashboard);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.toastMessage(error.toString());
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);

    _myRepo.signUpApi(data).then((value) {
      setSignUpLoading(false);
      Utils.toastMessage('SignUp Successfully');
      Navigator.pushReplacementNamed(context, RoutesName.dashboard);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      Utils.toastMessage(error.toString());
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
