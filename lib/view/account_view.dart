import 'package:bookstore/config/routes/routes_name.dart';
import 'package:bookstore/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userViewMode = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account"),
      ),
      body: ElevatedButton(
          onPressed: () {
            userViewMode.removeUser();
            Navigator.pushReplacementNamed(context, RoutesName.splash);
          },
          child: const Text("Sign Out")),
    );
  }
}
