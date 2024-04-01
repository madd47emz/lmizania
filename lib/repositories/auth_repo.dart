import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  String baseUrl = "http://192.168.96.208:3000/auth";
  Future<String> login(String username, String password) async {
    final SharedPreferences cashe = await SharedPreferences.getInstance();

    Dio dio = Dio();
    dio.options.receiveTimeout = const Duration(seconds: 100);
    dio.options.connectTimeout = const Duration(seconds: 100);

    try {
      Response response = await dio.post("$baseUrl/login/user",
          data: {'emailOrUserName': username, 'password': password});

      if (response.statusCode == 201) {
        cashe.setString("accessToken", response.data["accessToken"]);
        return "success";
      } else {
        return response.data["message"];
      }
    } on DioError catch (e) {
      if (e.response != null) {
        return e.response!.data["message"];
      } else {
        print('Error: ${e.message}');
      }
      return "error connecting";
    }
  }

  Future<String> register(String username, String email, String pw) async {
    final SharedPreferences cashe = await SharedPreferences.getInstance();

    Dio dio = Dio();
    dio.options.receiveTimeout = const Duration(seconds: 100);
    dio.options.connectTimeout = const Duration(seconds: 100);

    try {
      Response response = await dio.post("$baseUrl/register/user",
          data: {"username": username, "email": email, "password": pw});

      if (response.statusCode == 201) {
        cashe.setString("accessToken", response.data["accessToken"]);
        cashe.setString("emailToken", response.data["emailToken"]);
        return "success";
      } else {
        return response.data["message"][0];
      }
    } on DioError catch (e) {
      if (e.response != null) {
        return e.response!.data["message"][0];
      } else {
        print('Error: ${e.message}');
      }
      return "error connecting";
    }
  }


  Future<bool> validateEmail(String otp) async {
    final SharedPreferences cashe = await SharedPreferences.getInstance();
    final String? token = cashe.getString("emailToken");

    Dio dio = Dio();
    dio.options.receiveTimeout = const Duration(seconds: 100);
    dio.options.connectTimeout = const Duration(seconds: 100);

    try {
      Response response = await dio.get("$baseUrl/email/verify/$token/$otp");

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }

    return false;
  }

  Future<String> verifyEmail(String email) async {
    final SharedPreferences cashe = await SharedPreferences.getInstance();

    Dio dio = Dio();
    dio.options.receiveTimeout = const Duration(seconds: 100);
    dio.options.connectTimeout = const Duration(seconds: 100);

    try {
      Response response = await dio.get("$baseUrl/email/forgot-password/$email");

      if (response.statusCode == 200) {
        cashe.setString("emailToken", response.data["newPasswordToken"]);
        cashe.setString("email", email);
        return "success";
      } else {
        return response.data["message"];
      }
    } on DioError catch (e) {
      if (e.response != null) {
        return e.response!.data["message"];
      } else {
        print('Error: ${e.message}');
      }
      return "error connecting";
    }
  }

  Future<bool> resetPassword(String otp, String newPassword) async {
    final SharedPreferences cashe = await SharedPreferences.getInstance();
    final String? token = cashe.getString("emailToken");

    Dio dio = Dio();
    dio.options.receiveTimeout = const Duration(seconds: 100);
    dio.options.connectTimeout = const Duration(seconds: 100);

    try {
      Response response = await dio.post("$baseUrl/email/reset-password/$otp",data: {"newPassword":newPassword,"newPasswordToken":token});

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }

    return false;

  }
}
