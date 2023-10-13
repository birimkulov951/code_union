import 'package:code_union/core/dio/api_interceptor.dart';
import 'package:code_union/domain/repositories/token_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

const _baseUrl = "http://45.10.110.181:8080";
const _requestTimeOutInSeconds = Duration(seconds: 5);

@module
abstract class DioModule {
  @Named('Unauthorized')
  @singleton
  Dio getUnauthorizedDioClient() {
    final dioClient = _dioClient();
    dioClient.interceptors.addAll([
      UnauthorizedRequestInterceptor(),
    ]);
    return dioClient;
  }

  @singleton
  Dio getAuthorizedDioClient(TokenRepository tokenRepository) {
    final dioClient = _dioClient();
    dioClient.interceptors.addAll([
      AuthorizedRequestInterceptor(tokenRepository),
    ]);
    return dioClient;
  }

  Dio _dioClient() {
    final baseOptions = BaseOptions(
      baseUrl: _baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: _requestTimeOutInSeconds,
      receiveTimeout: _requestTimeOutInSeconds,
    );
    return Dio(baseOptions);
  }
}
