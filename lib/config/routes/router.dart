import 'package:bookstore/config/routes/routes_name.dart';
import 'package:bookstore/dashboard.dart';
import 'package:bookstore/models/books_list_model.dart';
import 'package:bookstore/view/account_view.dart';
import 'package:bookstore/view/books_details_view.dart';
import 'package:bookstore/view/home_view.dart';
import 'package:bookstore/view/library_view.dart';
import 'package:bookstore/view/login_view.dart';
import 'package:bookstore/view/shop_view.dart';
import 'package:bookstore/view/signup_view.dart';
import 'package:bookstore/view/splash_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());

      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginView());

      case RoutesName.signup:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignUpView());

      case RoutesName.dashboard:
        return MaterialPageRoute(
            builder: (BuildContext context) => const DashBoard());

      case RoutesName.account:
        return MaterialPageRoute(
            builder: (BuildContext context) => const AccountView());

      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeView());

      case RoutesName.library:
        return MaterialPageRoute(
            builder: (BuildContext context) => LibraryView());

      case RoutesName.shop:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ShopView());

      case RoutesName.details:
        return MaterialPageRoute(
            builder: (BuildContext context) => BooksDetailsView(
                  book: routeSettings.arguments as BookInfo,
                ));

      // case RoutesName.dataList:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) =>  const DataListView());

      // case RoutesName.booksGrid:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const BooksGridView());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
