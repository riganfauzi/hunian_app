import 'package:flutter/material.dart';
import 'package:hunian_app/core/constants/app_colors.dart';

class CustomFilterButtonWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final double size;

  const CustomFilterButtonWidget({super.key, this.onTap, this.size = 50});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.tune, color: AppColors.white, size: 22),
      ),
    );
  }
}
