import 'package:dio/dio.dart';

class RegisterController {
  Dio dio = Dio();

  Future<bool> register({
    required String fullName,
    required String userName,
    required String password,
  }) async {
    if (fullName.isEmpty || userName.isEmpty || password.isEmpty) {
      return false;
    }
    try {
      final res = await dio.post("http://todo.trienss.id.vn/users/register",
          data: {
            'fullName': fullName,
            'userName': userName,
            'password': password
          });
      if (res.statusCode == 201) return true;
    } catch (e) {
      print("Error : " + e.toString());
      return false;
    }
    return false;
  }
}
