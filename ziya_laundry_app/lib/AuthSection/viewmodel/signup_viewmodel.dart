
import 'package:flutter/material.dart';
import 'package:ziya_laundry_app/AuthSection/model/signup_model.dart';
import 'package:ziya_laundry_app/constants/validators/signup_validator.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthModel _signupModel = AuthModel();
  String? signupNameError;
  String? signupMobileError;
  String? signupPasswordError;
  String? confirmPasswordError;
  String? agreementError;

  // Login State
  final AuthModel _loginModel = AuthModel();
  String? loginNameError;
  String? loginMobileError;
  String? loginPasswordError;

  // OTP Logic
  final String _correctOtp = "4054"; 
  List<String> otpDigits = List.filled(4, '');
  List<bool?> otpStatus = List.filled(4, null); 

  // Location State
  String? pincode;
  bool isPincodeChecked = false;
  bool isServiceAvailable = false;


  bool get isAgreed => _signupModel.agreed;
  bool get isRememberMe => _loginModel.rememberMe;
  bool get isOtpValid => otpDigits.join() == _correctOtp;

  void updateSignupName(String value) {
    _signupModel.name = value;
    signupNameError = null;
    notifyListeners();
  }

  void updateSignupMobile(String value) {
    _signupModel.mobile = value;
    signupMobileError = null;
    notifyListeners();
  }

  void updateSignupPassword(String value) {
    _signupModel.password = value;
    signupPasswordError = null;
    notifyListeners();
  }

  void updateConfirmPassword(String value) {
    _signupModel.confirmPassword = value;
    confirmPasswordError = null;
    notifyListeners();
  }

  void toggleAgreement(bool value) {
    _signupModel.agreed = value;
    agreementError = null;
    notifyListeners();
  }

  void updateLoginName(String value) {
    _loginModel.name = value;
    loginNameError = null;
    notifyListeners();
  }

  void updateLoginMobile(String value) {
    _loginModel.mobile = value;
    loginMobileError = null;
    notifyListeners();
  }

  void updateLoginPassword(String value) {
    _loginModel.password = value;
    loginPasswordError = null;
    notifyListeners();
  }

  void toggleRememberMe(bool value) {
    _loginModel.rememberMe = value;
    notifyListeners();
  }

  void updatePincode(String value) {
    pincode = value;
    // Reset status if user starts typing again after a check
    isPincodeChecked = false;
    isServiceAvailable = false;
    notifyListeners();
  }

  void checkLocationAvailability() {
    if (pincode == null || pincode!.length < 6) return;

    isPincodeChecked = true;
        if (pincode == "683101") {
      isServiceAvailable = true;
    } else {
      isServiceAvailable = false;
    }
    
    notifyListeners();
  }

  // -------------------------
  // 🔹 VALIDATION & SUBMIT
  // -------------------------
  bool validateSignup() {
    signupNameError = SignupValidator.validateName(_signupModel.name);
    signupMobileError = SignupValidator.validateMobile(_signupModel.mobile);
    signupPasswordError = SignupValidator.validatePassword(_signupModel.password);
    confirmPasswordError = SignupValidator.validateConfirmPassword(
      _signupModel.password,
      _signupModel.confirmPassword,
    );
    agreementError = SignupValidator.validateAgreement(_signupModel.agreed);

    notifyListeners();

    return signupNameError == null &&
        signupMobileError == null &&
        signupPasswordError == null &&
        confirmPasswordError == null &&
        agreementError == null;
  }

  bool validateLogin() {
    loginNameError = SignupValidator.validateName(_loginModel.name);
    loginMobileError = SignupValidator.validateMobile(_loginModel.mobile);
    loginPasswordError = SignupValidator.validatePassword(_loginModel.password);

    notifyListeners();

    return loginNameError == null && loginMobileError == null && loginPasswordError == null;
  }

  bool submitSignup() {
    if (!validateSignup()) return false;
    debugPrint('Signup Success');
    return true;
  }

  bool submitLogin() {
    if (!validateLogin()) return false;
    debugPrint('Login Success');
    return true;
  }

  // -------------------------
  // 🔹 OTP LOGIC
  // -------------------------
  void setOtpDigit(int index, String value) {
    if (index < 0 || index >= 4) return;

    otpDigits[index] = value;

    if (value.isEmpty) {
      otpStatus[index] = null;
    } else {
      otpStatus[index] = (value == _correctOtp[index]);
    }
    notifyListeners();
  }

  void clearOtp() {
    otpDigits = List.filled(4, '');
    otpStatus = List.filled(4, null);
    notifyListeners();
  }
}