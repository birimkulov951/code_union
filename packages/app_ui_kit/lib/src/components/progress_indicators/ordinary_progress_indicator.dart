import 'package:app_ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

const _containerHeight = 100.0;
const _containerWidth = 100.0;
const _borderRadius = 8.0;
const _progressIndicatorPadding = 20.0;

class OrdinaryProgressIndicator extends StatelessWidget {
  const OrdinaryProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _containerHeight,
      width: _containerWidth,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(_borderRadius),
          bottomRight: Radius.circular(_borderRadius),
          topLeft: Radius.circular(_borderRadius),
          bottomLeft: Radius.circular(_borderRadius),
        ),
      ),
      padding: const EdgeInsets.all(_progressIndicatorPadding),
      child: const CircularProgressIndicator(),
    );
  }
}
