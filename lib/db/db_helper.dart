import 'package:dio/dio.dart';
import 'package:soft_bd_task/utils/constant.dart';

class DBService{


  static Future<Response?> getApiData(String api) async {
    var dio = Dio();
    try {
      var response = await dio.get(baseUrl+api);
      if (response.statusCode == 200) {
        return response;
      }
    } on DioError catch (e) {
      print(e.toString());
    }
    return null ;
  }


}