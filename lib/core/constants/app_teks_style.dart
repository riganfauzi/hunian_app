import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  // Heading
  static const TextStyle heading1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  // Body
  static const TextStyle bodyRegular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodySecondary = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  // Description
  static const TextStyle description = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );

  // Label / Link
  static const TextStyle link = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.textLink,
  );

  // Button
  static const TextStyle button = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static const TextStyle label = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );
}
