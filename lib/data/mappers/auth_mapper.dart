import 'package:code_union/data/remote/dto/requests/auth_request.dart';
import 'package:code_union/data/remote/dto/responses/auth_response.dart';
import 'package:code_union/domain/entities/auth_data.dart';
import 'package:code_union/domain/entities/auth_req_data.dart';

extension ToaDataExt on AuthResponse {
  // toEntity or toData? What is better?
  AuthData toData() => AuthData(
        id: user.id,
        email: user.email,
        nickname: user.nickname,
        accessToken: tokens.accessToken,
        refresherToken: tokens.refreshToken,
      );
}

extension ToRequestExt on AuthReqData {
  AuthRequest toRequest() {
    return AuthRequest(
      email: email,
      password: password,
    );
  }
}
