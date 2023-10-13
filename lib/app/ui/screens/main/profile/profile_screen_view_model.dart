// ignore_for_file: use_build_context_synchronously

import 'package:code_union/app/navigation/app_route.dart';
import 'package:code_union/domain/bloc/profile_bloc.dart';
import 'package:code_union/domain/event/profile_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileScreenViewModel {
  Future<void> gotoAuthScreen(BuildContext context) async {
    context.goNamed(AppRoute.auth);
  }

  void showErrorMessage(BuildContext context, String errorText) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorText),
      ),
    );
  }

  void exitProfile(BuildContext context) {
    context.read<ProfileBloc>().add(ExitProfileEvent());
  }
}
