import 'package:app_ui_kit/ui_kit.dart';
import 'package:code_union/app/ui/screens/main/profile/profile_screen_view_model.dart';
import 'package:code_union/domain/bloc/profile_bloc.dart';
import 'package:code_union/domain/state/profile_state.dart';
import 'package:code_union_localization/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    required this.viewModel,
    super.key,
  });

  final ProfileScreenViewModel viewModel;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          context.t.profile.profile,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocConsumer<ProfileBloc, ProfileState>(
            listener: (BuildContext context, ProfileState state) {
              if (state is ProfileStateSuccess) {
                widget.viewModel.gotoAuthScreen(context);
              }
              if (state is ProfileStateFail) {
                widget.viewModel.showErrorMessage(context, state.errorText);
              }
            },
            buildWhen: (_, state) => state is ProfileStateInitial,
            builder: (context, state) {
              return Center(
                child: OrdinaryButton(
                  text: context.t.profile.exit,
                  onTap: () {
                    widget.viewModel.exitProfile(context);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
