// ignore_for_file: library_private_types_in_public_api

import 'package:bookstore/view_model/splash_view_model.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final SplashViewModel _splashViewModel = SplashViewModel();

  @override
  void initState() {
    super.initState();
    _splashViewModel.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 200),
            Text(
              'Bookstore',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Text("There is no friend as loyal as a book.")
          ],
        ),
      ),
    );
  }
}
