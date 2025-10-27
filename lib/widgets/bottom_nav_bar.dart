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
    final icons = ['Home svg.svg', 'Portfolia svg.svg', 'Input svg.svg', 'Profile svg.svg'];
    final labels = ['Home', 'Portfolio', 'Input', 'Profile'];

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.gray,
      items: List.generate(icons.length, (index) {
        final isSelected = currentIndex == index;
        return 
        BottomNavigationBarItem(
          icon: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                height: 3,
                width: isSelected ? 30 : 0,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 4),
              SvgPicture.asset('assets/icons/${icons[index]}',
              colorFilter: ColorFilter.mode(
                currentIndex == index ? AppColors.primary : AppColors.gray,
                BlendMode.srcIn,
              )),
            ],
          ),
          label: labels[index],
        );
      }),
    );
  }
}
