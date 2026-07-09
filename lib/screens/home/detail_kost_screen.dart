import 'package:flutter/material.dart';
import 'package:hunian_app/core/widgets/custom_detail_bottom_bar_widget.dart';
import 'package:hunian_app/core/widgets/custom_facility_chip_widget.dart';
import 'package:provider/provider.dart';
import 'package:hunian_app/controllers/kost_controller.dart';
import 'package:hunian_app/core/constants/app_colors.dart';
import 'package:hunian_app/core/constants/app_teks_style.dart';
import 'package:hunian_app/core/utils/currency_formatter.dart';
import 'package:hunian_app/models/kost_model.dart';

class DetailKostScreen extends StatefulWidget {
  final String kostId;

  const DetailKostScreen({super.key, required this.kostId});

  @override
  State<DetailKostScreen> createState() => _DetailKostScreenState();
}

class _DetailKostScreenState extends State<DetailKostScreen> {
  bool _isFavorite = false;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    final kostController = context.read<KostController>();
    Future.microtask(() {
      if (!mounted) return;
      kostController.fetchKostDetail(widget.kostId);
    });
  }

  @override
  void dispose() {
    context.read<KostController>().clearSelectedKost();
    super.dispose();
  }

  List<String> _parseFacilities(String raw) {
    if (raw.trim().isEmpty) return [];
    return raw
        .split(',')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final kostController = context.watch<KostController>();

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: kostController.isDetailLoading
          ? const Center(child: CircularProgressIndicator())
          : kostController.detailErrorMessage != null
          ? _buildError(context, kostController.detailErrorMessage!)
          : kostController.selectedKost == null
          ? const Center(child: Text('Data tidak ditemukan'))
          : _buildContent(context, kostController.selectedKost!),
    );
  }

  Widget _buildError(BuildContext context, String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 40),
            const SizedBox(height: 8),
            Text(
              message,
              style: AppTextStyles.bodySecondary.copyWith(color: Colors.red),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () =>
                  context.read<KostController>().fetchKostDetail(widget.kostId),
              child: const Text('Coba Lagi'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, KostModel kost) {
    final facilities = _parseFacilities(kost.facilities);

    return SizedBox.expand(
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header image
                Stack(
                  children: [
                    Image.network(
                      kost.image,
                      width: double.infinity,
                      height: 280,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: double.infinity,
                        height: 280,
                        color: AppColors.grey,
                        child: const Icon(
                          Icons.image_not_supported,
                          size: 40,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _circleIconButton(
                              icon: Icons.arrow_back_ios_new_rounded,
                              onTap: () => Navigator.pop(context),
                            ),
                            _circleIconButton(
                              icon: _isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              iconColor: _isFavorite
                                  ? AppColors.red
                                  : AppColors.textPrimary,
                              onTap: () {
                                setState(() => _isFavorite = !_isFavorite);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // Card info
                Transform.translate(
                  offset: const Offset(0, -24),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height - 280 + 24,
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(28),
                          topRight: Radius.circular(28),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      kost.name,
                                      style: AppTextStyles.heading1.copyWith(
                                        color: AppColors.textPrimary,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on_outlined,
                                          size: 16,
                                          color: AppColors.grey,
                                        ),
                                        const SizedBox(width: 2),
                                        Expanded(
                                          child: Text(
                                            '${kost.location}, ${kost.city}',
                                            style: AppTextStyles.bodySecondary
                                                .copyWith(
                                                  color: AppColors.grey,
                                                ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.backgroundLight,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      kost.rating.toString(),
                                      style: AppTextStyles.bodyRegular.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
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
                                  kost.type,
                                  style: AppTextStyles.bodySecondary.copyWith(
                                    color: AppColors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Sisa ${kost.availability} kamar',
                                style: AppTextStyles.bodySecondary.copyWith(
                                  color: AppColors.red,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 24),

                          // Facilities
                          if (facilities.isNotEmpty) ...[
                            Text('Facilities', style: AppTextStyles.heading2),
                            const SizedBox(height: 12),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              child: Row(
                                children: facilities
                                    .map(
                                      (f) => Padding(
                                        padding: const EdgeInsets.only(
                                          right: 12,
                                        ),
                                        child: CustomFacilityChipWidget(
                                          facility: f,
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                            const SizedBox(height: 24),
                          ],

                          // Description
                          Text('Description', style: AppTextStyles.heading2),
                          const SizedBox(height: 8),
                          Text(
                            kost.description.isNotEmpty
                                ? kost.description
                                : 'Tidak ada deskripsi untuk hunian ini.',
                            style: AppTextStyles.bodyRegular.copyWith(
                              color: AppColors.textPrimary,
                              height: 1.5,
                            ),
                            maxLines: _isExpanded ? null : 3,
                            overflow: _isExpanded
                                ? TextOverflow.visible
                                : TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          if (kost.description.length > 150)
                            GestureDetector(
                              onTap: () =>
                                  setState(() => _isExpanded = !_isExpanded),
                              child: Text(
                                _isExpanded ? 'Show less' : 'Show more...',
                                style: AppTextStyles.bodyRegular.copyWith(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),

                          const SizedBox(height: 24),

                          // Photos
                          if (kost.photos.isNotEmpty) ...[
                            Text('Photos', style: AppTextStyles.heading2),
                            const SizedBox(height: 12),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              child: Row(
                                children: kost.photos.map((photoUrl) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 12),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.network(
                                        photoUrl,
                                        width: 138,
                                        height: 179,
                                        fit: BoxFit.cover,
                                        loadingBuilder:
                                            (context, child, loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              }
                                              return Container(
                                                width: 220,
                                                height: 170,
                                                decoration: BoxDecoration(
                                                  color:
                                                      AppColors.backgroundLight,
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                                child: const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              );
                                            },
                                        errorBuilder:
                                            (
                                              context,
                                              error,
                                              stackTrace,
                                            ) => Container(
                                              width: 138,
                                              height: 179,
                                              decoration: BoxDecoration(
                                                color:
                                                    AppColors.backgroundLight,
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              child: const Icon(
                                                Icons.image_not_supported,
                                                color: AppColors.grey,
                                                size: 32,
                                              ),
                                            ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            const SizedBox(height: 24),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom bar
          CustomDetailBottomBarWidget(
            price: CurrencyFormatter.formatRupiah(kost.price),
            onBookNow: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Booking untuk ${kost.name} berhasil diajukan!',
                  ),
                  backgroundColor: AppColors.primaryColor,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _circleIconButton({
    required IconData icon,
    required VoidCallback onTap,
    Color iconColor = AppColors.textPrimary,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration: const BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 18, color: iconColor),
      ),
    );
  }
}
