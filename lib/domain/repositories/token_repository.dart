import 'package:code_union/domain/entities/token_data.dart';

abstract class TokenRepository {
  Future<void> saveToken(TokenData token);

  Future<TokenData?> getToken();

  Future<String> getBearerToken();

 Future<void> deleteToken();

// can be implemented later
// Future<TokenData> refreshToken(TokenData token);
}
