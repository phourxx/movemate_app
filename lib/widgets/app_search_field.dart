import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moniepoint_quiz/helpers/colors.dart';

class AppSearchField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final bool readonly;
  final VoidCallback? onTap;

  const AppSearchField({
    super.key,
    this.onTap,
    this.onChanged,
    required this.readonly,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      onChanged: onChanged,
      readOnly: readonly,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: 'Enter the receipt number...',
        hintStyle: GoogleFonts.encodeSans(
          color: Colors.grey,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: Theme.of(context).primaryColor,
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 4.w),
          child: const CircleAvatar(
            backgroundColor: AppColors.orange,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(48.r),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 8.h,
        ),
      ),
    );
  }
}
