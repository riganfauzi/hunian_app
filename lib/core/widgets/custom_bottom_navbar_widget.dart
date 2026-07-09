import 'package:flutter/material.dart';
import 'package:hunian_app/core/constants/app_colors.dart';
import 'package:hunian_app/core/constants/app_teks_style.dart';

class CustomBottomNavbarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavbarWidget({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  Widget _buildIcon(String activeAsset, String inactiveAsset, int index) {
    final bool isActive = currentIndex == index;
    return Image.asset(
      isActive ? activeAsset : inactiveAsset,
      width: 22,
      height: 22,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.grey,
      selectedLabelStyle: AppTextStyles.bodySecondary.copyWith(
        color: AppColors.primaryColor,
        fontWeight: FontWeight.w600,
        fontSize: 11,
      ),
      unselectedLabelStyle: AppTextStyles.bodySecondary.copyWith(fontSize: 11),
      items: [
        BottomNavigationBarItem(
          icon: _buildIcon(
            'assets/icons/home_active_icon.png',
            'assets/icons/home_inactive_icon.png',
            0,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(
            'assets/icons/history_active_icon.png',
            'assets/icons/history_inactive_icon.png',
            1,
          ),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(
            'assets/icons/favorite_active_icon.png',
            'assets/icons/favorite_inactive_icon.png',
            2,
          ),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(
            'assets/icons/profile_active_icon.png',
            'assets/icons/profile_inactive_icon.png',
            3,
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
