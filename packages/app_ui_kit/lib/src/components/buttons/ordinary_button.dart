import 'package:app_ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class OrdinaryButton extends StatelessWidget {
  const OrdinaryButton({
    required this.text,
    super.key,
    this.onTap,
  });

  final String text;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,

      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.primary),
      ),
      child: Text(
        text,
        style: AppTypography.text,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
      ),
    );
  }
}
