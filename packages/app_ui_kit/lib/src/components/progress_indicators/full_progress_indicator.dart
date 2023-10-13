import 'package:app_ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

const _backgroundColorOpacity = .3;

class FullProgressIndicator extends StatelessWidget {
  const FullProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.height,
      color: AppColors.grey.withOpacity(_backgroundColorOpacity),
      child: const Center(
        child: OrdinaryProgressIndicator(),
      ),
    );
  }
}
