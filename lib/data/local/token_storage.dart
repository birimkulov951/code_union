import 'package:code_union/domain/entities/token_data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

const _accessTokenKey = 'accessToken';
const _refreshTokenKey = 'refreshToken';

@injectable
class TokenStorage {
  const TokenStorage(this._secureStorage);

  final FlutterSecureStorage _secureStorage;

  Future<void> saveToken(TokenData token) async {
    await _secureStorage.write(
      key: _accessTokenKey,
      value: token.accessToken,
    );
    await _secureStorage.write(
      key: _refreshTokenKey,
      value: token.refreshToken,
    );
  }

  Future<TokenData?> getToken() async {
    final accessToken = await _secureStorage.read(key: _accessTokenKey);
    final refreshToken = await _secureStorage.read(key: _refreshTokenKey);
    if (accessToken == null || refreshToken == null) {
      return null;
    }
    return TokenData(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }

  Future<void> deleteToken() async {
    await _secureStorage.deleteAll();
  }
}
