import 'package:dio/dio.dart';
import 'package:flutterbloc/model/user_model.dart';

class ApiService {
  Future<List<UserModel>> getData() async {
    List<UserModel> userDataList = [];
    final Dio dio = Dio();
    try {
      Response response =
          await dio.get("https://jsonplaceholder.typicode.com/users");
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        data.forEach((element) {
          UserModel userModel = UserModel.fromJson(element);
          userDataList.add(userModel);
        });
        return userDataList;
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }
}
