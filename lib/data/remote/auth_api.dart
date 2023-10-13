import 'package:code_union/data/remote/dto/requests/auth_request.dart';
import 'package:code_union/data/remote/dto/responses/auth_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api.g.dart';

@RestApi()
@singleton
abstract class AuthApi {
  @factoryMethod
  factory AuthApi(@Named("Unauthorized") Dio dio) = _AuthApi;

  @POST('/api/v1/auth/login')
  Future<AuthResponse> authenticate(@Body() AuthRequest request);
}
