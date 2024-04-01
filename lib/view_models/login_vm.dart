import '../repositories/auth_repo.dart';

class LoginViewmodel{
  final authrepo = AuthRepo();
  Future<String> login(String username, String pw){
    return authrepo.login(username, pw);
  }

}