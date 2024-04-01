import '../repositories/auth_repo.dart';

class RegisterViewmodel{
  final authrepo = AuthRepo();
  Future<String> register(String username,String email, String pw){
    return authrepo.register(username, email,pw);
  }

}