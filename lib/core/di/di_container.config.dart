// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:code_union/core/dio/dio_module.dart' as _i11;
import 'package:code_union/data/local/local_module.dart' as _i12;
import 'package:code_union/data/local/token_storage.dart' as _i5;
import 'package:code_union/data/remote/auth_api.dart' as _i6;
import 'package:code_union/data/repositories/auth_repository_impl.dart' as _i8;
import 'package:code_union/data/repositories/token_repository_impl.dart'
    as _i10;
import 'package:code_union/domain/repositories/auth_repository.dart' as _i7;
import 'package:code_union/domain/repositories/token_repository.dart' as _i9;
import 'package:dio/dio.dart' as _i3;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    final localModule = _$LocalModule();
    gh.singleton<_i3.Dio>(
      dioModule.getUnauthorizedDioClient(),
      instanceName: 'Unauthorized',
    );
    gh.singletonAsync<_i4.FlutterSecureStorage>(
        () => localModule.createSecureStorage());
    gh.factoryAsync<_i5.TokenStorage>(() async =>
        _i5.TokenStorage(await getAsync<_i4.FlutterSecureStorage>()));
    gh.singleton<_i6.AuthApi>(
        _i6.AuthApi(gh<_i3.Dio>(instanceName: 'Unauthorized')));
    gh.singleton<_i7.AuthRepository>(_i8.AuthRepositoryImpl(gh<_i6.AuthApi>()));
    gh.singletonAsync<_i9.TokenRepository>(() async =>
        _i10.TokenRepositoryImpl(await getAsync<_i5.TokenStorage>()));
    gh.singletonAsync<_i3.Dio>(() async => dioModule
        .getAuthorizedDioClient(await getAsync<_i9.TokenRepository>()));
    return this;
  }
}

class _$DioModule extends _i11.DioModule {}

class _$LocalModule extends _i12.LocalModule {}
