part of 'init_dependencies.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<FirebaseService>(() => FirebaseService());
  getIt.registerLazySingleton<IUserRepository>(() => UserRepositoryImp(getIt<FirebaseService>()));
  getIt.registerFactory<LoginBloc>(() => LoginBloc(userRepository: getIt<IUserRepository>()));
  getIt.registerFactory<LoginViewModel>(() => LoginViewModel(loginBloc: getIt<LoginBloc>()));
  getIt.registerFactory<LoginView>(() => LoginView(loginViewModel: getIt<LoginViewModel>()));
}