import 'package:dio/dio.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/api/api_consumer.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/api/api_interceptors.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/api/end_points.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/errors/eceptions.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;
  DioConsumer({required this.dio}) {
    dio.options.baseUrl =EndPoints.baseUrl ;
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }
  @override
  Future delete(String path, dynamic data,
      {Map<String, dynamic>? queryParams, bool isFormData = false}) async {
    try {
      final responde = await dio.delete(path,
          data: isFormData ? FormData.fromMap(data) : data,
          queryParameters: queryParams);
      return responde.data;
    } on DioException catch (e) {
      handleDioExeption(e);
    }
  }

  @override
  Future get(String path, Object? data,
      {Map<String, dynamic>? queryParams}) async {
    try {
      final responde =
          await dio.get(path, data: data, queryParameters: queryParams);
      return responde.data;
    } on DioException catch (e) {
      handleDioExeption(e);
    }
  }

  @override
  Future post(String path, dynamic data,
      {Map<String, dynamic>? queryParams, bool isFormData = false}) async {
    try {
      final responde = await dio.post(path,
          data: isFormData ? FormData.fromMap(data) : data,
          queryParameters: queryParams);
      return responde.data;
    } on DioException catch (e) {
      handleDioExeption(e);
    }
  }

  @override
  Future put(String path, dynamic data,
      {Map<String, dynamic>? queryParams, bool isFormData = false}) async {
    try {
      final responde = await dio.put(path,
          data: isFormData ? FormData.fromMap(data) : data,
          queryParameters: queryParams);
      return responde.data;
    } on DioException catch (e) {
      handleDioExeption(e);
    }
  }
}
