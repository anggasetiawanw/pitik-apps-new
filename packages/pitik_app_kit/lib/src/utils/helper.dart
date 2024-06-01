class Helper {
  static bool checkLengthPassword(String password) {
    RegExp regexLength = RegExp(r'^.{7,}$');
    return regexLength.hasMatch(password);
  }

  static bool checkPassword(String password) {
    RegExp regexPassword = RegExp(r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{1,}$');
    return regexPassword.hasMatch(password);
  }
  
}
