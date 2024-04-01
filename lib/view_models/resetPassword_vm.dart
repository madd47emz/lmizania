import '../repositories/auth_repo.dart';

class ResetPasswordViewmodel{
  final authrepo = AuthRepo();
  Future<bool> resetPassword(String otp,String newPassword){
    return authrepo.resetPassword(otp, newPassword);
  }
}