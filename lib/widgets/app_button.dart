import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_quiz/helpers/colors.dart';
import 'package:moniepoint_quiz/widgets/app_text.dart';

class AppButton extends HookWidget {
  final String text;
  final VoidCallback onTap;
  const AppButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final scaleCtrl = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );
    return GestureDetector(
      onTap: () {
        scaleCtrl.forward();
        Future.delayed(const Duration(milliseconds: 200), () {
          scaleCtrl.reverse().then((_) => onTap());
        });
      },
      child: ScaleTransition(
        scale: Tween<double>(
          begin: 1.0,
          end: 0.7,
        ).animate(scaleCtrl),
        child: Container(
          // height: 50.h,
          width: double.infinity,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            vertical: 16.h,
          ),
          decoration: ShapeDecoration(
            color: AppColors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(36.r),
            )
          ),
          child: AppText(text, color: Colors.white, weight: FontWeight.w600,),
        ),
      ),
    );
  }
}
