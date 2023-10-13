import 'dart:async';

import 'package:code_union/domain/bloc/base_bloc.dart';
import 'package:code_union/domain/event/profile_event.dart';
import 'package:code_union/domain/repositories/token_repository.dart';
import 'package:code_union/domain/state/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends BaseBloc<ProfileEvent, ProfileState> {
  ProfileBloc(
    this._tokenRepository,
  ) : super(ProfileStateInitial()) {
    on<ExitProfileEvent>(_authenticate);
  }

  final TokenRepository _tokenRepository;

  Future<void> _authenticate(
    ExitProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileStateLoading());
    try {
      await _tokenRepository.deleteToken();

      emit(ProfileStateSuccess());
    } on Object catch (e) {
      emit(ProfileStateFail(e.toString()));
    }
  }
}
