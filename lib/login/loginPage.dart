import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../controllers/loginController.dart';
import '../home/homePage.dart';
import '../services/loginServices.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}



class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void pushToHomePage() {
    Navigator.pushReplacement<void, void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return loginWidget();
  }

  Widget loginWidget() {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page"),),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              buildEmailController(),
              const SizedBox(
                height: 10,
              ),
              buildPasswordController(),
              const SizedBox(
                height: 10,
              ),
              buildLoginButtonController()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEmailController() {
    return TextFormField(
      controller: email,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
          hintText: 'Email Address'
      ),
      validator: (email) =>
          email != null && email.isNotEmpty ? 'Email is required' : null,
    );
  }

  Widget buildPasswordController() {
    return TextFormField(
      controller: password,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        hintText: 'Password'
      ),
      validator: (password) => password != null && password.isNotEmpty
          ? 'Password is required'
          : null,
    );
  }

  Widget buildLoginButtonController() {
    return ElevatedButton(
        onPressed: () async {
          if (kDebugMode) {
            print('Login Clicked');
          }
          if(await loginProcess(email.value.text, password.value.text)) {
            pushToHomePage();
          }
          else {
            // show failed to login toast.
            var snackBar = const SnackBar(content: Text('Invalid Login'),);
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: const Text(
          'Submit',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ));
  }
}
