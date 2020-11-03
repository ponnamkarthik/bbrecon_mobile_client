import 'package:bbrecon/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioClient {
  factory DioClient() {
    return _singleton;
  }

  DioClient._internal() {
    if (_dio == null) {
      init();
    }
  }

  static final DioClient _singleton = DioClient._internal();

  Dio _dio;

  Future<String> _getAuthorizationToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('api');
    return token ?? '';
  }

  dynamic init() {
    _dio = Dio();
    _dio.options = BaseOptions(
      validateStatus: (status) => status <= 500,
      baseUrl: Constants.baseUrl,
    );
    final _catchInterceptor = DioCacheManager(
      CacheConfig(
        defaultMaxAge: const Duration(hours: 1),
        defaultMaxStale: const Duration(days: 7),
      ),
    ).interceptor as InterceptorsWrapper;
    _dio.interceptors.add(_catchInterceptor);
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options) async {
      final token = await _getAuthorizationToken();
      if (token.isNotEmpty) {
        options.headers['X-API-KEY'] = token;
      }
      return options;
    }, onResponse: (response) async {
      // TODO: Remove Print Statements
      debugPrint(response.request.uri.toString());
      debugPrint(response.statusCode.toString());

      return response;
    }, onError: (error) async {
      // TODO: Remove Print Statements
      debugPrint('Error');
      debugPrint(error?.response?.request?.uri.toString());
      debugPrint(error?.response?.statusCode?.toString() ?? '');
      return error;
    }));
  }

  Dio get ref => _dio;
}

final dioClient = DioClient();
