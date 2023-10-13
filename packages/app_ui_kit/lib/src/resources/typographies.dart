import 'package:flutter/cupertino.dart';

import '../../ui_kit.dart';

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

  static const errorText = TextStyle(
    fontSize: 14,
    height: 18 / 14,
    fontWeight: FontWeight.w500,
    color: AppColors.red,
  );

  static const secondaryText = TextStyle(
    fontSize: 16,
    height: 20 / 16,
    fontWeight: FontWeight.w500,
    color: AppColors.grey,
  );

  static final smallTextSecondary = smallText.copyWith(color: AppColors.grey);
}
