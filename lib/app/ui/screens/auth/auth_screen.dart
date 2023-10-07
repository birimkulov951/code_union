import 'package:code_union/app/ui/screens/auth/auth_screen_view_model.dart';
import 'package:code_union/domain/entities/auth_req_data.dart';
import 'package:code_union/library/resource/colors.dart';
import 'package:code_union/library/resource/typography.dart';
import 'package:code_union_localization/strings.g.dart';
import 'package:flutter/material.dart';

const _paddingOne = 10.0;
const _paddingTwo = 50.0;

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          children: [
            const Icon(
              IconData(
                0xf04be,
                fontFamily: 'MaterialIcons',
              ),
            ),
            const SizedBox(height: _paddingTwo),
            ElevatedButton(
              onPressed: () {
                // TODO: Use textEditingController texts
                const AuthReqData authReqData = AuthReqData(
                  email: 'maripbekoff@gmail.com',
                  password: 'adminadmin',
                );

                widget.viewModel.login(context, authReqData);
              },
              child: Text(
                context.t.authentication.logIn,
                style: AppTypography.text,
              ),
            ),
            const SizedBox(height: _paddingOne),
            ElevatedButton(
              onPressed: () {
                widget.viewModel.signIn(context);
              },
              child: Text(
                context.t.authentication.signIn,
                style: AppTypography.text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
