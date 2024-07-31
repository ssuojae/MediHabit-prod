import 'package:firebase_auth/firebase_auth.dart';


abstract interface class IUserRepository {
  Future<UserCredential> loginWithGoogle();
  
  // 추후 다른 메서드 정의 (loginWithApple, loginWithKakao)
}