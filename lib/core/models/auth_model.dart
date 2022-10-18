import 'package:flutter/material.dart';

class Login with ChangeNotifier {
  bool? isShowPassword;
  String username;
  String password;
  String errorMessage;

  void isPasswordShown() {
    if (isShowPassword == true) {
      isShowPassword = false;
    } else {
      isShowPassword = true;
    }
    notifyListeners();
  }

  void login(username, password, BuildContext context) {
    if (username == 'admin' && password == 'admin') {
      Navigator.pushNamed(context, 'home');
    } else {
      errorMessage = 'Username atau Password Salah';
    }
    notifyListeners();
  }

  Login(this.password, this.username, this.errorMessage);
}

class Register with ChangeNotifier {
  bool? isShowPassword;
  String username;
  String password;
  String email;

  void isPasswordShown() {
    if (isShowPassword == true) {
      isShowPassword = false;
    } else {
      isShowPassword = true;
    }
    notifyListeners();
  }

  void register(username, password, email, BuildContext context) {
    Navigator.pushNamed(context, 'login');
    notifyListeners();
  }

  Register(this.password, this.username, this.email);
}
