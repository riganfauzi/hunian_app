import 'package:flutter/material.dart';
import 'package:hunian_app/core/constants/app_colors.dart';
import 'package:hunian_app/core/constants/app_teks_style.dart';

class CustomCategoryButton extends StatelessWidget {
  final String label;
  final Widget activeIcon;
  final Widget inactiveIcon;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomCategoryButton({
    super.key,
    required this.label,
    required this.activeIcon,
    required this.inactiveIcon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : AppColors.white,
          borderRadius: BorderRadius.circular(12),
          // border: Border.all(
          //   color: isSelected ? AppColors.primaryColor : AppColors.grey,
          //   width: 1,
          // ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            isSelected ? activeIcon : inactiveIcon,
            const SizedBox(width: 8),
            Text(
              label,
              style: AppTextStyles.bodyRegular.copyWith(
                color: isSelected ? AppColors.white : AppColors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
