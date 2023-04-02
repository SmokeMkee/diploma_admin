import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Api {
  late final dio = Dio(options)..interceptors.addAll([_BasicInterceptor()]);

  final options = BaseOptions(
      baseUrl: 'https://public.test.onlinebank.kz/api/1c-service',
      connectTimeout: 30000,
      receiveTimeout: 30000);
}

class _BasicInterceptor implements Interceptor {
  final storage = const FlutterSecureStorage();

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler)async {
        var token  = 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI8c3RyaW5nPiIsImV4cCI6MTY4MTY2ODAwMH0.fZ-bcKdTjHTnbr1u7MxkNX25R68G3Gacd76X8dawCLkXWwV6Bt7BrYKGyxxeGAbCaT6ZTMY2m9Uh5QtMai4TXA';
        options.headers = {
          "Accept": "application/json",
          "Authorization" :"Bearer $token"
        };

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}