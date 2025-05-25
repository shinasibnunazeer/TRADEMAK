import 'package:flutter/material.dart';
import 'package:tagmak/core/theme/colors.dart';

class ElevatedButtonTeme {
  static final elevatedButtonThemeData = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: AppColors.secondary,
      disabledBackgroundColor: AppColors.secondary,
      disabledForegroundColor: AppColors.secondary,
      // side: const BorderSide(color: AppColors.secondary),
      padding: const EdgeInsets.symmetric(vertical: 20),
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0)),
    ),
  );
}
