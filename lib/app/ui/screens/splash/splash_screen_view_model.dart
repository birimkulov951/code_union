// ignore_for_file: use_build_context_synchronously

import 'package:code_union/app/navigation/app_route.dart';
import 'package:code_union/domain/entities/token_data.dart';
import 'package:code_union/domain/repositories/token_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class SplashScreenViewModel {
  final TokenRepository _tokenRepository;

  SplashScreenViewModel(
    TokenRepository tokenRepository,
  ) : _tokenRepository = tokenRepository;

  void checkUserAuth(BuildContext context) async {
    // TODO: rewrite with BloC
    final TokenData? tokenData = await _tokenRepository.getToken();
    if (tokenData != null) {
      gotoAuthScreen(context);
    } else {
      gotoMainScreen(context);
    }
  }

  Future<void> gotoMainScreen(BuildContext context) async {
    context.goNamed(AppRoute.main);
  }

  Future<void> gotoAuthScreen(BuildContext context) async {
    context.goNamed(AppRoute.auth);
  }
}
