import '../repositories/auth_repo.dart';

class EmailVerificationViewModel{
  final authrepo = AuthRepo();
  Future<bool> verifyEmail(String otp){
    return authrepo.validateEmail(otp);
  }
}