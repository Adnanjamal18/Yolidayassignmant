 import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/theme/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final icons = ['home.svg', 'portfolio.svg', 'input.svg', 'profile.svg'];
    final labels = ['Home', 'Portfolio', 'Input', 'Profile'];

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.gray,
      items: List.generate(icons.length, (index) {
        return BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/${icons[index]}',
              colorFilter: ColorFilter.mode(
                currentIndex == index ? AppColors.primary : AppColors.gray,
                BlendMode.srcIn,
              )),
          label: labels[index],
        );
      }),
    );
  }
}
