import 'package:flutter/material.dart';
import 'package:hunian_app/core/constants/app_teks_style.dart';

class CustomCityCardWidget extends StatelessWidget {
  final String cityName;
  final String imageAsset;
  final VoidCallback? onTap;

  const CustomCityCardWidget({
    super.key,
    required this.cityName,
    required this.imageAsset,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // Gambar kota
              Image.asset(
                imageAsset,
                width: 120,
                height: 150,
                fit: BoxFit.cover,
              ),

              // Gradient overlay (supaya teks terbaca di atas gambar)
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.6),
                      ],
                    ),
                  ),
                ),
              ),

              // Nama kota di bawah
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Text(
                  cityName,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyRegular.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
