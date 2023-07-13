import 'package:bookstore/utils/constant.dart';
import 'package:bookstore/view_model/auth_view_model.dart';
import 'package:bookstore/view_model/home_view_model.dart';
import 'package:bookstore/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/routes/router.dart';
import 'config/routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: MaterialApp(
        title: 'Bookstore',
        initialRoute: RoutesName.splash,
        onGenerateRoute: AppRouter.onGenerateRoute,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
          useMaterial3: true,
        ),
      ),
    );
  }
}
