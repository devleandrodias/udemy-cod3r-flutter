import 'dart:io';

enum EAuthMode {
  SIGN_IN,
  SIGN_UP,
}

class AuthData {
  File image;
  String name;
  String email;
  String password;
  EAuthMode _mode = EAuthMode.SIGN_IN;

  bool get isSignIn {
    return _mode == EAuthMode.SIGN_IN;
  }

  bool get isSignUp {
    return _mode == EAuthMode.SIGN_UP;
  }

  void toggleMode() {
    _mode = _mode == EAuthMode.SIGN_IN ? EAuthMode.SIGN_UP : EAuthMode.SIGN_IN;
  }
}
