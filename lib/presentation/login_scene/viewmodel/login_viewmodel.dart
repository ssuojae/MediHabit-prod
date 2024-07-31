import '../state_management/bloc.dart';


final class LoginViewModel {
  final LoginBloc loginBloc;

  LoginViewModel({required this.loginBloc});

  void authenticateWithGoogle() {
    loginBloc.add(const LoginEvent.googleLoginRequested());
  }
}