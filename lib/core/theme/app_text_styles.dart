import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle heading = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle body = TextStyle(
    fontSize: 14.sp,
    color: AppColors.textPrimary,
  );

  static TextStyle grayText = TextStyle(
    fontSize: 12.sp,
    color: AppColors.gray,
  );
}
