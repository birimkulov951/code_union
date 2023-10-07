import 'package:code_union/data/mappers/auth_mapper.dart';
import 'package:code_union/data/remote/auth_api.dart';
import 'package:code_union/domain/entities/auth_data.dart';
import 'package:code_union/domain/entities/auth_req_data.dart';
import 'package:code_union/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._authApi);

  final AuthApi _authApi;

  @override
  Future<AuthData> authenticate(AuthReqData request) async {
    final response = await _authApi.authenticate(request.toRequest());

    return response.toData();
  }
}
