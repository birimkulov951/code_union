import 'package:code_union/app/navigation/app_route.dart';
import 'package:code_union/domain/bloc/auth_bloc.dart';
import 'package:code_union/domain/entities/auth_req_data.dart';
import 'package:code_union/domain/event/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AuthScreenViewModel {
  void login(BuildContext context, AuthReqData authReqData) {
    context.read<AuthBloc>().add(AuthenticateAuthEvent(authReqData));
  }

  void signIn(BuildContext context) {}

  Future<void> gotoMainScreen(BuildContext context) async {
    context.goNamed(AppRoute.main);
  }

  void showErrorMessage(BuildContext context, String errorText) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorText),
      ),
    );
  }
}
