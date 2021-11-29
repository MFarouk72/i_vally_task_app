import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginController extends ChangeNotifier{
  AccessToken? _accessToken;
  Map<String, dynamic>? _userData;
  bool _checking = false;

  Map<String , dynamic>? get userData => _userData;
  bool get checking =>_checking;
  String prettyPrint(Map json) {
    JsonEncoder encoder = new JsonEncoder.withIndent('  ');
    String pretty = encoder.convert(json);
    return pretty;
  }

  Future<void> checkIfIsLogged() async {
    final accessToken = await FacebookAuth.instance.accessToken;
      _checking = false;
    if (accessToken != null) {
      print("is Logged:::: ${prettyPrint(accessToken.toJson())}");
      final userData = await FacebookAuth.instance.getUserData();
      // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
      _accessToken = accessToken;
        _userData = userData;
    }
    notifyListeners();
  }

  void _printCredentials() {
    print(
      prettyPrint(_accessToken!.toJson()),
    );
  }
  Future<void> login() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      _accessToken = result.accessToken;
      _printCredentials();
      final userData = await FacebookAuth.instance.getUserData();
      _userData = userData;
    } else {
      print(result.status);
      print(result.message);
    }
      _checking = false;
    notifyListeners();
  }

  Future<void> logOut() async {
    await FacebookAuth.instance.logOut();
    _accessToken = null;
    _userData = null;
    notifyListeners();
  }
}