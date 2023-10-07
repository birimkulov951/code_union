import 'package:code_union/app/ui/screens/splash/splash_screen_view_model.dart';
import 'package:code_union/library/resource/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    required this.viewModel,
    super.key,
  });

  final SplashScreenViewModel viewModel;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 2));
      if (mounted) {
        widget.viewModel.checkUserAuth(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white30,
      body: Center(
        child: Icon(
          IconData(
            0xf04be,
            fontFamily: 'MaterialIcons',
          ),
        ),
      ),
    );
  }
}
