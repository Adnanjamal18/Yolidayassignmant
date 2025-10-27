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
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(
              item.image,
              width: 120.w,
              height: 100.h,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(width: 12.w),

          // Text Column
          Expanded(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween, // 👈 important
    children: [
      // top text content
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            style: AppTextStyles.body.copyWith(fontSize: 15.sp),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4.h),
          Text(
            item.language,
            style: AppTextStyles.grayText.copyWith(fontSize: 12.sp),
          ),
          SizedBox(height: 2.h),
          Text(
            item.subject,
            style: AppTextStyles.grayText.copyWith(fontSize: 12.sp),
          ),
        ],
      ),

      // bottom grade badge
      Align(
        alignment: Alignment.bottomRight,
        child: Container(
          width: 40.w,
          height: 28.h,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(8.r),
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
      ),
    ],
  ),
),
        ],
      ),
    );
  }
}
