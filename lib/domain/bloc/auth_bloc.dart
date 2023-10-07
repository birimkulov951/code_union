import 'dart:async';

import 'package:code_union/domain/bloc/base_bloc.dart';
import 'package:code_union/domain/entities/token_data.dart';
import 'package:code_union/domain/event/auth_event.dart';
import 'package:code_union/domain/repositories/auth_repository.dart';
import 'package:code_union/domain/repositories/token_repository.dart';
import 'package:code_union/domain/state/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  AuthBloc(
    this._authRepository,
    this._tokenRepository,
  ) : super(AuthStateInitial()) {
    on<AuthenticateAuthEvent>(_authenticate);
  }

  final AuthRepository _authRepository;
  final TokenRepository _tokenRepository;

  Future<void> _authenticate(
    AuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthStateLoading());
    try {
      if (event is AuthenticateAuthEvent) {
        final data = await _authRepository.authenticate(event.authReqData);

        final TokenData tokenData = TokenData(
          accessToken: data.accessToken,
          refreshToken: data.refresherToken,
        );
        await _tokenRepository.saveToken(tokenData);

        emit(AuthStateSuccess(data));
      }
    } on Object catch (_) {
      emit(AuthStateFail());
    }
  }
}
