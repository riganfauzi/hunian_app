import 'package:flutter/material.dart';
import 'package:hunian_app/core/constants/app_colors.dart';
import 'package:hunian_app/core/constants/app_teks_style.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double height;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.height = 56,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primaryColor,
          disabledBackgroundColor: (backgroundColor ?? AppColors.primaryColor)
              .withValues(alpha: 0.6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          elevation: 2,
        ),
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.5,
                ),
              )
            : Text(
                text,
                style: AppTextStyles.button.copyWith(
                  color: textColor ?? AppColors.textWhite,
                ),
              ),
      ),
    );
  }
}
