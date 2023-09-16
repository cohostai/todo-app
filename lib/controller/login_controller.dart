import 'package:dio/dio.dart';
import 'package:todo_list/model/user.dart';

class GlobalData {
  GlobalData._();

  static final GlobalData instance = GlobalData._();

  factory GlobalData() {
    return instance;
  }

  late User user;
  String token = '';
}

class LoginController {
  Dio dio = Dio();

  Future<bool> login({
    required String userName,
    required String password,
  }) async {
    if (userName.isEmpty || password.isEmpty) {
      return false;
    }
    try {
      final res = await dio.post("http://todo.trienss.id.vn/users/login",
          data: {'userName': userName, 'password': password});
      final data = res.data;
      GlobalData.instance.user = User.fromJson(data['user']);
      GlobalData.instance.token = data['token'];
      if (GlobalData.instance.token != '') {
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }
}
