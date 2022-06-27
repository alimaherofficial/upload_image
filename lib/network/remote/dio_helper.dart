import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://student.valuxapps.com/api/',
          receiveDataWhenStatusError: true,
          headers: {
            'lang':'ar',
            'Content-Type': 'application/json',
          }),
    );
  }

  static Future<Response> putData({
    required String? url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    required String token,
  }) async {
    dio!.options.headers ={
      'Authorization': token,
    };
    return dio!.put(
      url!,
      data: data,
    );
  }
}
