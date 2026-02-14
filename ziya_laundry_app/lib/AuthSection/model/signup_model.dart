class AuthModel {
  String name;
  String mobile;
  String password;
  String confirmPassword;
  bool agreed;
  bool rememberMe;

  AuthModel({
    this.name = '',
    this.mobile = '',
    this.password = '',
    this.confirmPassword = '',
    this.agreed = false,
    this.rememberMe = false,
  });
}
