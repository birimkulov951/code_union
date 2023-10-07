import 'package:code_union/library/resource/colors.dart';
import 'package:flutter/cupertino.dart';

class AppTypography {
  AppTypography._();

  static const title = TextStyle(
    fontSize: 20,
    height: 24 / 20,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static const text = TextStyle(
    fontSize: 16,
    height: 20 / 16,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );

  static const smallText = TextStyle(
    fontSize: 14,
    height: 18 / 14,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );

  static final smallTextSecondary = smallText.copyWith(color: AppColors.grey);
}
