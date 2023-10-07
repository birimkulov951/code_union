import 'package:code_union/domain/entities/auth_data.dart';
import 'package:code_union/domain/entities/auth_req_data.dart';

abstract class AuthRepository {
  Future<AuthData> authenticate(AuthReqData request);
}
