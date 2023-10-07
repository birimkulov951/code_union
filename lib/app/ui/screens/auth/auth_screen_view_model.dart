import 'package:code_union/domain/bloc/auth_bloc.dart';
import 'package:code_union/domain/entities/auth_req_data.dart';
import 'package:code_union/domain/event/auth_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreenViewModel {
  void login(BuildContext context, AuthReqData authReqData) {
    context.read<AuthBloc>().add(AuthenticateAuthEvent(authReqData));
  }

  void signIn(BuildContext context) {}
}
