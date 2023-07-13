import 'package:bookstore/config/routes/routes_name.dart';
import 'package:bookstore/utils/utils.dart';
import 'package:bookstore/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewMode = Provider.of<AuthViewModel>(context);

    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('SingUp'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              decoration: const InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.alternate_email)),
              onFieldSubmitted: (valu) {
                Utils.fieldFocusChange(
                    context, emailFocusNode, passwordFocusNode);
              },
            ),
            ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _passwordController,
                    obscureText: _obsecurePassword.value,
                    focusNode: passwordFocusNode,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock_open_rounded),
                      suffixIcon: InkWell(
                          onTap: () {
                            _obsecurePassword.value = !_obsecurePassword.value;
                          },
                          child: Icon(_obsecurePassword.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility)),
                    ),
                  );
                }),
            SizedBox(
              height: height * .085,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_emailController.text.isEmpty) {
                    Utils.toastMessage('Please enter email');
                  } else if (_passwordController.text.isEmpty) {
                    Utils.toastMessage('Please enter password');
                  } else if (_passwordController.text.length < 6) {
                    Utils.toastMessage('Please enter 6 digit password');
                  } else {
                    Map data = {
                      'email': _emailController.text.toString(),
                      'password': _passwordController.text.toString(),
                    };

                    authViewMode.signUpApi(data, context);
                    print('api hit');
                  }
                },
                child: const Text("Signup")),
            SizedBox(
              height: height * .02,
            ),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.login);
                },
                child: const Text("Already  hace an accont? Logi"))
          ],
        ),
      ),
    );
  }
}
