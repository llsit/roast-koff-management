import 'package:flutter/material.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecase/login_usecase.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginUseCase loginUseCase;

  bool isLoading = false;
  String? error;
  UserEntity? user;
  bool isLoginSuccess = false;

  LoginViewModel(this.loginUseCase);

  Future<void> login(String email, String password) async {
    isLoading = true;
    notifyListeners();

    try {
      print("email: ${email.toString()}");
      print("password: ${password.toString()}");
      user = await loginUseCase(email, password);
      if (user == null) {
        error = "Login failed";
      } else {
        isLoginSuccess = true;
      }
    } catch (e) {
      print("error: ${e.toString()}");
      debugPrint("error: ${e.toString()}");
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
