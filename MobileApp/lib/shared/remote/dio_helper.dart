import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://kalemecrazy.herokuapp.com/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getdata({
    @required String url,
    Map<String, dynamic> query,
    String lang = 'en',
    String token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token??'',
    };
    return await dio.get(url, queryParameters: query,);
  }

  static Future<Response> postdata({
    @required String url,
    Map<String, dynamic> query,
    @required Map<String, dynamic> data,
    String lang = 'en',
    String token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token??'',
    };
    return await dio.post(url, queryParameters: query, data: data);
  }
  static Future<Response> putdata({
    @required String url,
    Map<String, dynamic> query,
    @required Map<String, dynamic> data,
    String lang = 'en',
    String token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token??'',
    };
    return await dio.put(url, queryParameters: query, data: data);
  }
  static Future<Response> deleteData({
    @required String url,
    Map<String, dynamic> query,
    Map<String, dynamic> data,
    @required String token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': 'en',
      'Authorization': token,
    };
    return await dio.delete(
      url,
      queryParameters: query,
      data: data
    );
  }
}
//'http://10.0.2.2:8000/'