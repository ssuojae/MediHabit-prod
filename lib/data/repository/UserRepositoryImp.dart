import 'package:firebase_auth/firebase_auth.dart';
import 'package:medihabit/data/data_source/remote/firebase_service.dart';
import 'package:medihabit/domain/repository_interface/IUserRepository.dart';


final class UserRepositoryImp implements IUserRepository {
  final FirebaseService _firebaseService;

  UserRepositoryImp(this._firebaseService);

  @override
  Future<UserCredential> loginWithGoogle() {
    return _firebaseService.signInWithGoogle();
  }

  // 추후 소셜로그인 메서드 구현 (loginWithApple, loginWithKakao)
}