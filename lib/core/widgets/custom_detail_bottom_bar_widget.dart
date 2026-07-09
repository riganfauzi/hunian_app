import 'package:flutter/material.dart';
import 'package:hunian_app/core/constants/app_colors.dart';
import 'package:hunian_app/core/constants/app_teks_style.dart';
import 'package:hunian_app/core/widgets/custom_button_widget.dart';

class CustomDetailBottomBarWidget extends StatelessWidget {
  final String price;
  final VoidCallback onBookNow;

  const CustomDetailBottomBarWidget({
    super.key,
    required this.price,
    required this.onBookNow,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 12,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      price,
                      style: AppTextStyles.heading1.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '/month',
                      style: AppTextStyles.bodySecondary.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: CustomButton(
                  text: 'Book Now',
                  height: 48,
                  onPressed: onBookNow,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
