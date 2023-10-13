import 'package:app_ui_kit/ui_kit.dart';
import 'package:code_union/app/ui/screens/auth/auth_screen_view_model.dart';
import 'package:code_union/domain/bloc/auth_bloc.dart';
import 'package:code_union/domain/entities/auth_req_data.dart';
import 'package:code_union/domain/state/auth_state.dart';
import 'package:code_union_localization/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const _paddingTen = 10.0;
const _paddingTwenty = 20.0;

class AuthScreen extends StatefulWidget {
  const AuthScreen({
    required this.viewModel,
    super.key,
  });

  final AuthScreenViewModel viewModel;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          context.t.authentication.authentication,
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (BuildContext context, AuthState state) {
          if (state is AuthStateSuccess) {
            widget.viewModel.gotoMainScreen(context);
          }
          if (state is AuthStateFail) {
            widget.viewModel.showErrorMessage(context, state.errorText);
          }
        },
        buildWhen: (_, state) => state is AuthStateInitial,
        builder: (context, state) {
          return Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OrdinaryInput(
                    focusNode: emailFocus,
                    controller: emailController,
                  ),
                  OrdinaryInput(
                    focusNode: passwordFocus,
                    controller: passwordController,
                  ),
                  const SizedBox(height: _paddingTwenty),
                  OrdinaryButton(
                    text: context.t.authentication.logIn,
                    onTap: () {
                      final authReqData = AuthReqData(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );

                      widget.viewModel.login(context, authReqData);
                    },
                  ),
                  const SizedBox(height: _paddingTen),
                  OrdinaryButton(
                    text: context.t.authentication.signIn,
                    onTap: () {
                      widget.viewModel.showErrorMessage(context, 'TODO');
                    },
                  ),
                ],
              ),
              if (state is AuthStateLoading) const FullProgressIndicator(),
            ],
          );
        },
      ),
    );
  }
}
