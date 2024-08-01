import 'package:flutter/widgets.dart';

import '../state_management/bloc.dart';


final class LoginViewModel {
  final LoginBloc loginBloc;

  LoginViewModel({required this.loginBloc});

  void authenticateWithGoogle(BuildContext context) {
    loginBloc.add(LoginEvent.googleLoginRequested(context));
  }


  
}
