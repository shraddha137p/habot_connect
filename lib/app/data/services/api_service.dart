import 'package:dio/dio.dart';
import 'package:habot_connect_test/utilities/api_constants.dart';
import 'package:habot_connect_test/utilities/widgets/app_logger.dart';

class ApiService {
  late final Dio dio;

  ApiService() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-trace-id':
          '8f3d1b2a-4c9e-4a11-b8d2-9901ef23a011',
          'x-logic-hash':
          'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855',
        },
      ),
    );

    _addInterceptors();
  }

  void _addInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          AppLogger.info(
            '========== API REQUEST ==========\n'
                'Method: ${options.method}\n'
                'URL: ${options.uri}\n'
                'Headers: ${options.headers}\n'
                'Body: ${options.data}\n'
                '=================================',
          );

          handler.next(options);
        },

        onResponse: (response, handler) {
          AppLogger.info(
            '========== API RESPONSE ==========\n'
                'Status Code: ${response.statusCode}\n'
                'URL: ${response.requestOptions.uri}\n'
                'Response: ${response.data}\n'
                '==================================',
          );

          handler.next(response);
        },

        onError: (DioException error, handler) {
          AppLogger.error(
            '========== API ERROR ==========\n'
                'Type: ${error.type}\n'
                'Method: ${error.requestOptions.method}\n'
                'URL: ${error.requestOptions.uri}\n'
                'Status Code: ${error.response?.statusCode}\n'
                'Response: ${error.response?.data}\n'
                'Message: ${error.message}\n'
                '================================',
            error,
            error.stackTrace,
          );

          handler.next(error);
        },
      ),
    );
  }

  Future<Response> post(
      String endpoint, {
        dynamic data,
      }) async {
    return await dio.post(
      endpoint,
      data: data,
    );
  }
}