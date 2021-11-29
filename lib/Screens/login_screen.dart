import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:i_vally_task_app/Screens/home_screen.dart';
import 'dart:convert';

import 'package:i_vally_task_app/controlers/login_controler.dart';
import 'package:i_vally_task_app/models/lowest_price_data.dart';
import 'package:provider/provider.dart';

class LoginScreenView extends StatefulWidget {
  const LoginScreenView({Key? key}) : super(key: key);

  @override
  State<LoginScreenView> createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  late LoginController loginController;
  @override
  void initState() {
    super.initState();
    loginController= LoginController();
    loginController.checkIfIsLogged();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Login With Facebook'),
      ),
      body: loginController.checking
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 20),
                    SizedBox(height: 20),
                    CupertinoButton(
                      color: Colors.blue,
                      child: Text(
                        loginController.userData != null ? "LOGOUT" : "LOGIN",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: loginController.userData != null ? loginController.logOut : loginController.login,
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
    );
  }
}
