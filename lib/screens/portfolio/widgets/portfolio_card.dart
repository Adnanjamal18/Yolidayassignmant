import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../models/portfolio_item.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_colors.dart';

class PortfolioCard extends StatelessWidget {
  final PortfolioItem item;
  const PortfolioCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.r,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(item.image),
              Text(item.title, style: AppTextStyles.body),
              SizedBox(height: 4.h),
              Text(item.language, style: AppTextStyles.grayText),
              Text(item.subject, style: AppTextStyles.grayText),
            ],
          ),
         Container(
  width: 45.w,
  height: 28.w,
  decoration: BoxDecoration(
    color: Colors.amber,
    borderRadius: BorderRadius.circular(8.r), // Rounded square
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 4.r,
        offset: Offset(0, 2.h),
      ),
    ],
  ),
  alignment: Alignment.center,
  child: Text(
    item.grade,
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14.sp,
    ),
  ),
),
        ],
      ),
    );
  }
}
