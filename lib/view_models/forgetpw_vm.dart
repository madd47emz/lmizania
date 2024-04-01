

import '../repositories/auth_repo.dart';

class ForgetPasswordViewmodel{
  final authrepo = AuthRepo();
  Future<String> verifyEmail(String email){
    return authrepo.verifyEmail(email);
  }
}