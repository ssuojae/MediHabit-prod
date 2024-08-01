import 'package:flutter/material.dart';
import '../state_management/bloc.dart';


final class LoginViewModel {
  final LoginBloc loginBloc;

  LoginViewModel({required this.loginBloc});

  void authenticateWithGoogle() {
    loginBloc.add(const LoginEvent.googleLoginRequested());
  }

  void listenToStateChanges(BuildContext context) {
    loginBloc.stream.listen((state) {
      _handleStateChange(context, state);
    });
  }

  void _handleStateChange(BuildContext context, LoginState state) {
    if (state.isAuthenticated == true) {
      _navigateToCalendar(context);
    } else if (state.error != null) {
      _showError(state.error!);
    }
  }

  void _navigateToCalendar(BuildContext context) {
    Navigator.pushNamed(context, '/calendar');
  }

  void _showError(String error) {
    print(error);
  }
}
