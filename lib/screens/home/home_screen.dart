import 'package:flutter/material.dart';
import 'package:hunian_app/controllers/kost_controller.dart';
import 'package:hunian_app/core/constants/app_colors.dart';
import 'package:hunian_app/core/constants/app_teks_style.dart';
import 'package:hunian_app/core/utils/currency_formatter.dart';
import 'package:hunian_app/core/widgets/custom_bottom_navbar_widget.dart';
import 'package:hunian_app/core/widgets/custom_category_button_widget.dart';
import 'package:hunian_app/core/widgets/custom_city_card_widget.dart';
import 'package:hunian_app/core/widgets/custom_filter_button_widget.dart';
import 'package:hunian_app/core/widgets/custom_recommended_places_card_widget.dart';
import 'package:hunian_app/core/widgets/custom_search_bar_widget.dart';
import 'package:hunian_app/screens/home/detail_kost_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategory = 0; // 0 = kost, 1 = laundry
  int _selectedIndex = 0; // bottom navigation bar

  @override
  void initState() {
    super.initState();
    // Fetch data
    final kostController = context.read<KostController>();
    Future.microtask(() {
      if (!mounted) return;
      kostController.fetchKosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final kostController = context.watch<KostController>();

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Appbar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Greeting
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi, Emma',
                          style: AppTextStyles.heading2.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        Text(
                          'Find your ideal place to live!',
                          style: AppTextStyles.heading1.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Notification Icon
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        'assets/icons/notification_icon.png',
                        height: 20,
                        width: 20,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Location
              Row(
                children: [
                  const Icon(Icons.location_on, color: AppColors.red, size: 18),
                  const SizedBox(width: 4),
                  Text(
                    'Jakarta Selatan',
                    style: AppTextStyles.heading2.copyWith(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Search Bar
              Row(
                children: [
                  Expanded(child: CustomSearchBarWidget()),
                  const SizedBox(width: 12),
                  CustomFilterButtonWidget(onTap: () {}),
                ],
              ),
              const SizedBox(height: 16),

              // Categories
              Text('Categories', style: AppTextStyles.heading2),
              const SizedBox(height: 12),
              Row(
                children: [
                  CustomCategoryButton(
                    label: 'Kost',
                    isSelected: _selectedCategory == 0,
                    onTap: () => setState(() => _selectedCategory = 0),
                    activeIcon: Image.asset(
                      'assets/icons/kost_active_icon.png',
                      width: 20,
                      height: 20,
                    ),
                    inactiveIcon: Image.asset(
                      'assets/icons/kost_inactive_icon.png',
                      width: 20,
                      height: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  CustomCategoryButton(
                    label: 'Laundry',
                    isSelected: _selectedCategory == 1,
                    onTap: () => setState(() => _selectedCategory = 1),
                    activeIcon: Image.asset(
                      'assets/icons/laundry_active_icon.png',
                      width: 20,
                      height: 20,
                    ),
                    inactiveIcon: Image.asset(
                      'assets/icons/laundry_inactive_icon.png',
                      width: 20,
                      height: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Popular Cities
              Text('Popular Cities', style: AppTextStyles.heading2),
              const SizedBox(height: 12),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    CustomCityCardWidget(
                      cityName: 'Jakarta',
                      imageAsset: 'assets/images/jakarta_image.png',
                      onTap: () {},
                    ),
                    CustomCityCardWidget(
                      cityName: 'Bandung',
                      imageAsset: 'assets/images/bandung_image.png',
                      onTap: () {},
                    ),
                    CustomCityCardWidget(
                      cityName: 'Surabaya',
                      imageAsset: 'assets/images/surabaya_image.png',
                      onTap: () {},
                    ),
                    CustomCityCardWidget(
                      cityName: 'Yogyakarta',
                      imageAsset: 'assets/images/yogyakarta_image.png',
                      onTap: () {},
                    ),
                    CustomCityCardWidget(
                      cityName: 'Jakarta',
                      imageAsset: 'assets/images/jakarta_image.png',
                      onTap: () {},
                    ),
                    CustomCityCardWidget(
                      cityName: 'Bandung',
                      imageAsset: 'assets/images/bandung_image.png',
                      onTap: () {},
                    ),
                    CustomCityCardWidget(
                      cityName: 'Surabaya',
                      imageAsset: 'assets/images/surabaya_image.png',
                      onTap: () {},
                    ),
                    CustomCityCardWidget(
                      cityName: 'Yogyakarta',
                      imageAsset: 'assets/images/yogyakarta_image.png',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Recommended Place
              Text('Recommended Place', style: AppTextStyles.heading2),
              const SizedBox(height: 12),

              // Loading state
              if (kostController.isLoading)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: CircularProgressIndicator(),
                  ),
                )
              // Error state
              else if (kostController.errorMessage != null)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 40,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          kostController.errorMessage!,
                          style: AppTextStyles.bodySecondary.copyWith(
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () =>
                              context.read<KostController>().fetchKosts(),
                          child: const Text('Coba Lagi'),
                        ),
                      ],
                    ),
                  ),
                )
              // Data state
              else if (kostController.kosts.isEmpty)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      'Tidak ada kost tersedia',
                      style: AppTextStyles.bodySecondary,
                    ),
                  ),
                )
              // List kost dari API
              else
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: kostController.kosts.length,
                  itemBuilder: (context, index) {
                    final kost = kostController.kosts[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: CustomRecommendedPlacesCardWidget(
                        imageAsset: kost.image,
                        name: kost.name,
                        location: kost.location,
                        type: kost.type,
                        availability: 'Sisa ${kost.availability} kamar',
                        price: CurrencyFormatter.formatRupiah(kost.price),
                        rating: kost.rating,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailKostScreen(kostId: kost.id),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavbarWidget(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
