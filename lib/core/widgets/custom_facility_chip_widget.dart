import 'package:flutter/material.dart';
import 'package:hunian_app/core/constants/app_colors.dart';
import 'package:hunian_app/core/constants/app_teks_style.dart';

class CustomFacilityChipWidget extends StatelessWidget {
  final String facility;

  const CustomFacilityChipWidget({super.key, required this.facility});

  String _facilityAsset(String facility) {
    final f = facility.toLowerCase();
    if (f.contains('bed') || f.contains('kasur')) {
      return 'assets/icons/bed_icon.png';
    }
    if (f.contains('wifi')) {
      return 'assets/icons/wifi_icon.png';
    }
    if (f.contains('ac')) {
      return 'assets/icons/ac_icon.png';
    }
    if (f.contains('shower') || f.contains('kamar mandi')) {
      return 'assets/icons/shower_icon.png';
    }
    if (f.contains('desk') || f.contains('meja')) {
      return 'assets/icons/desk_icon.png';
    }

    return 'assets/icons/facility_icon.png';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: IntrinsicWidth(
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 60),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  _facilityAsset(facility),
                  width: 20,
                  height: 20,
                  color: AppColors.white,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.check_circle_outline,
                    color: AppColors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  facility,
                  style: AppTextStyles.bodySecondary.copyWith(
                    color: AppColors.white,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
