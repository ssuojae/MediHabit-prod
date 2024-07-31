import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medihabit/domain/repository_interface/IUserRepository.dart';
import 'package:medihabit/presentation/login_scene/state_management/login_event.dart';
import 'package:medihabit/presentation/login_scene/state_management/login_state.dart';


final class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final IUserRepository userRepository;

  LoginBloc({required this.userRepository}) : super(LoginState.initial()) {
    on<LoginEvent>(_onLoginRequested);
  }

  void _onLoginRequested(LoginEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true));

    try {
      final userCredential = await event.when(
        googleLoginRequested: _loginWithGoogle,
        // appleLoginRequested: _loginWithApple,
        // kakaoLoginRequested: _loginWithKakao,
      );
      emit(state.copyWith(
        isLoading: false,
        isAuthenticated: true,
        user: userCredential.user,
      ));
    } catch (error) {
      emit(state.copyWith(
        isLoading: false,
        isAuthenticated: false,
        error: error.toString(),
      ));
    }
  }

  Future<UserCredential> _loginWithGoogle() async {
    return await userRepository.loginWithGoogle();
  }

  // Future<UserCredential> _loginWithApple() async {
  //   return await userRepository.loginWithApple();
  // }

  // Future<UserCredential> _loginWithKakao() async {
  //   return await userRepository.loginWithKakao();
  // }
}