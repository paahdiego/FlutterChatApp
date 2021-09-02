import 'package:flutter/material.dart';
import 'package:flutter_chat_app/modules/login/models/login_model.dart';
import 'package:flutter_chat_app/shared/auth/auth_controller.dart';
import 'package:flutter_chat_app/shared/auth/auth_service.dart';

import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginController extends ChangeNotifier {
  //State
  final stateNotifier = ValueNotifier<LoginState>(LoginState.not_loading);
  set state(LoginState state) => stateNotifier.value = state;
  LoginState get state => stateNotifier.value;

  void startLoading() {
    state = LoginState.loading;
    notifyListeners();
  }

  void stopLoading() {
    state = LoginState.not_loading;
    notifyListeners();
  }

  //Form
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  final authRepository = AuthService();

  Future<void> login({
    required BuildContext context,
  }) async {
    final authController = AuthController();

    if (formKey.currentState!.validate()) {
      startLoading();

      final login = LoginModel(
        email: emailController.text,
        password: passController.text,
      );

      try {
        final response = await authRepository.login(login);
        authController.authenticate(response);
        stopLoading();
        Navigator.pushReplacementNamed(
          context,
          "/home",
        );
      } catch (error) {
        stopLoading();
        showTopSnackBar(
          context,
          CustomSnackBar.error(
            backgroundColor: Colors.red,
            message: "$error",
          ),
        );
      }
    }
  }
}

enum LoginState {
  loading,
  not_loading,
}
