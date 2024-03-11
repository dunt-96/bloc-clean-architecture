// ignore_for_file: strict_raw_type

import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:template/main/env/app_env.dart';

import 'app_http_client_exceptions.dart';

/// A callback that returns a Dio response, presumably from a Dio method
/// it has called which performs an HTTP request, such as `dio.get()`,
/// `dio.post()`, etc.
typedef HttpLibraryMethod<T> = Future<Response<T>> Function();

/// Function which takes a Dio response object and an exception and returns
/// an optional [AppHttpClientException], optionally mapping the response
/// to a custom exception.
typedef ResponseExceptionMapper = AppNetworkResponseException? Function<T>(
  Response<T>,
  Exception,
);

/// Dio HTTP Wrapper with convenient, predictable exception handling.
class AppHttpClient {
  /// Create a new App HTTP Client with the specified Dio instance [client]
  /// and an optional [exceptionMapper].
  AppHttpClient({required Dio client, this.exceptionMapper})
      : _client = client {
    _client.options = dioBaseOptions;

    try {
      _client.interceptors
          // ..add(
          //   LogInterceptor(requestBody: true, responseBody: true),
          // )
          // ..add(
          //   InterceptorsWrapper(
          //     onRequest: (options, handler) async {
          //       // final token = await PreferUtil.getString(SecureStorages.token);
          //       // if (token != '') {
          //       // options.headers[HttpHeaders.authorizationHeader] =
          //       //       'Bearer $token';
          //       // }
          //       return handler.next(options);
          //     },
          //     onResponse: (e, handler) async {
          //       // await cacheManager.putFile(
          //       //   e.requestOptions.path.split('/').join('_').replaceAll(':', '_'),
          //       //   Uint8List.fromList(utf8.encode(jsonEncode(e.data))),
          //       // );
          //       return handler.next(e);
          //     },
          //   ),
          // )
          .add(
        AwesomeDioInterceptor(
          // Disabling headers and timeout would minimize the logging output.
          // Optional, defaults to true
          logRequestTimeout: false,
          logRequestHeaders: false,
          logResponseHeaders: false,

          // logger: debugPrint,
          // requestStyle:
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  final Dio _client;

  BaseOptions get dioBaseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
        connectTimeout: const Duration(milliseconds: 5000),
        receiveTimeout: const Duration(milliseconds: 5000),
      );

  String get baseUrl => EnvInfo.connectionString;

  Map<String, Object> get headers => {
        'accept': 'application/json',
        'Content-Type': 'application/json',
      };

  Map<String, dynamic>? updateHeader(Map<String, dynamic> data) {
    final header = {...headers, ...data};
    // if (!kTestMode) {
    //   dio.options.headers = header;
    // }
    return header;
  }

  /// If provided, this function which will be invoked when a response exception
  /// occurs, allowing the response exception to be mapped to a custom
  /// exception class which extends [AppHttpClientException].
  final ResponseExceptionMapper? exceptionMapper;

  /// HTTP GET request.
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    return _mapException(
      () => _client.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      ),
    );
  }

  /// HTTP POST request.
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return _mapException(
      () => _client.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      ),
    );
  }

  /// HTTP PUT request.
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return _mapException(
      () => _client.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      ),
    );
  }

  /// HTTP HEAD request.
  Future<Response<T>> head<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _mapException(
      () => _client.head(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      ),
    );
  }

  /// HTTP DELETE request.
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _mapException(
      () => _client.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      ),
    );
  }

  /// HTTP PATCH request.
  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return _mapException(
      () => _client.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      ),
    );
  }

  // Map Dio exceptions (and any other exceptions) to an exception type
  // supported by our application.
  Future<Response<T>> _mapException<T>(HttpLibraryMethod<T> method) async {
    try {
      return await method();
    } on DioException catch (exception) {
      switch (exception.type) {
        case DioExceptionType.cancel:
          throw AppNetworkException(
            reason: AppNetworkExceptionReason.canceled,
            exception: exception,
          );
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          throw AppNetworkException(
            reason: AppNetworkExceptionReason.timedOut,
            exception: exception,
          );
        case DioExceptionType.badResponse:
          // For DioErrorType.response, we are guaranteed to have a
          // response object present on the exception.
          final response = exception.response;
          if (response == null || response is! Response<T>) {
            // This should never happen, judging by the current source code
            // for Dio.
            throw AppNetworkResponseException(exception: exception);
          }
          throw exceptionMapper?.call(response, exception) ??
              AppNetworkResponseException(
                exception: exception,
                statusCode: response.statusCode,
                data: response.data,
              );
        case DioExceptionType.unknown:
        default:
          throw AppHttpClientException(exception: exception);
      }
    } catch (e) {
      throw AppHttpClientException(
        exception: e is Exception ? e : Exception('Unknown exception ocurred'),
      );
    }
  }
}
