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
        googleLoginRequested: () => _loginWithGoogle(),
      );
      _handleLoginSuccess(emit, userCredential);
    } catch (error) {
      _handleLoginError(emit, error);
    }
  }

  Future<UserCredential> _loginWithGoogle() async {
    return await userRepository.loginWithGoogle();
  }

  void _handleLoginSuccess(Emitter<LoginState> emit, UserCredential userCredential) {
    emit(state.copyWith(
      isLoading: false,
      isAuthenticated: true,
      user: userCredential.user,
    ));
  }

  void _handleLoginError(Emitter<LoginState> emit, Object error) {
    emit(state.copyWith(
      isLoading: false,
      isAuthenticated: false,
      error: error.toString(),
    ));
  }
}
