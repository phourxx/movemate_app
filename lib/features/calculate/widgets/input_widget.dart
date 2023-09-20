import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_quiz/helpers/colors.dart';

class InputWidget extends StatelessWidget {
  final Widget icon;
  final String hintText;
  final double? prefixSize;
  final Color fillColor;

  const InputWidget({
    super.key,
    required this.hintText,
    required this.icon,
    this.prefixSize,
    this.fillColor = AppColors.scaffoldBg,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: fillColor,
        prefixIconConstraints: prefixSize != null ? BoxConstraints(
          maxWidth: prefixSize!
        ) : null,
        prefixIcon: Container(
          margin: EdgeInsets.only(top: 10.h, bottom: 10.h, right: 8.w),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(color: Colors.grey[300]!),
            ),
          ),
          child: icon,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 8.h,
        ),
      ),
    );
  }
}
