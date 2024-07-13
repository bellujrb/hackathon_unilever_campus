import 'package:flutter/material.dart';
import 'package:frontend/core/styles/colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static AppTextStyles? _instance;

  static AppTextStyles get instance {
    _instance ??= AppTextStyles._();
    return _instance!;
  }

  TextStyle get superSmallBlack => TextStyle(
      color: AppColors.secondary,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none);

  TextStyle get smallBlack => TextStyle(
      color: AppColors.secondary,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none);

  TextStyle get smallWhite => TextStyle(
      color: AppColors.tertiary,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);
}

extension AppTextStylesExtension on BuildContext {
  AppTextStyles get appTextStyles => AppTextStyles.instance;
}
