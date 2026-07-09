import 'package:flutter/material.dart';
import 'package:hunian_app/core/constants/app_colors.dart';
import 'package:hunian_app/core/constants/app_teks_style.dart';

class CustomRecommendedPlacesCardWidget extends StatelessWidget {
  final String imageAsset;
  final String name;
  final String location;
  final String type;
  final String availability;
  final String price;
  final double rating;
  final VoidCallback? onTap;

  const CustomRecommendedPlacesCardWidget({
    super.key,
    required this.imageAsset,
    required this.name,
    required this.location,
    required this.type,
    required this.availability,
    required this.price,
    required this.rating,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
            bottom: 10,
          ),
          child: Row(
            children: [
              Stack(
                children: [
                  // Image
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    child: imageAsset.startsWith('http')
                        ? Image.network(
                            imageAsset,
                            width: 124,
                            height: 118,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                                  width: 124,
                                  height: 118,
                                  color: AppColors.grey,
                                  child: const Icon(
                                    Icons.image_not_supported,
                                    color: AppColors.grey,
                                  ),
                                ),
                          )
                        : Image.asset(
                            imageAsset,
                            width: 124,
                            height: 118,
                            fit: BoxFit.cover,
                          ),
                  ),

                  // Rating
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 14),
                          const SizedBox(width: 2),
                          Text(
                            rating.toString(),
                            style: AppTextStyles.bodySecondary.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 11,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),

              // Info kost
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nama kost
                    Text(
                      name,
                      style: AppTextStyles.bodyRegular.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),

                    // Lokasi
                    Text(
                      location,
                      style: AppTextStyles.bodySecondary.copyWith(fontSize: 12),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),

                    // Badge type & availability
                    Row(
                      children: [
                        // Badge type (Putra/Putri)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            type,
                            style: AppTextStyles.bodySecondary.copyWith(
                              color: AppColors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),

                        // Badge availability
                        Text(
                          availability,
                          style: AppTextStyles.bodySecondary.copyWith(
                            color: AppColors.red,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),

                    // Harga
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: price,
                            style: AppTextStyles.heading2.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ' /month',
                            style: AppTextStyles.bodySecondary.copyWith(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
            ],
          ),
        ),
      ),
    );
  }
}
