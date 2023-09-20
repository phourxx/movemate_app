import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moniepoint_quiz/helpers/extensions/string_extensions.dart';
import 'package:moniepoint_quiz/widgets/app_button.dart';
import 'package:moniepoint_quiz/widgets/app_text.dart';

class CalculateSuccessView extends HookWidget {
  const CalculateSuccessView({super.key});


  @override
  Widget build(BuildContext context) {
    final ctrl = useAnimationController(duration: const Duration(seconds: 1));
    final amount = useAnimation(
      Tween<double>(begin: 1, end: 1460).animate(
        CurvedAnimation(parent: ctrl, curve: Curves.easeIn),
      ),
    );

    // void animateAmount = (){
    //   amount.value += 1;
    //   Future.delayed(Duration(milliseconds: 10), (){
    //     animateAmount();
    //   });
    // };
    useEffect((){
      ctrl.forward();
      return;
    }, ['once']);
    return Material(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            Image.asset('logo'.png, alignment: Alignment.center, width: 200.w,),
            const Spacer(flex: 1),
            Image.asset('box'.png, alignment: Alignment.center, width: 160.w,),
            Gap(48.h),
            const AppText(
              'Total Estimated Amount',
              textAlign: TextAlign.center,
              color: Colors.black,
              weight: FontWeight.bold,
              size: 24,
            ),
            Gap(16.h),
            RichText(
              text: TextSpan(
                text: '\$${amount.toInt()}',
                style: GoogleFonts.encodeSans(
                  fontSize: 24.sp,
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  TextSpan(
                    text: ' USD',
                    style: GoogleFonts.encodeSans(
                      fontSize: 20.sp,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            Gap(10.h),
            const AppText('This amount is estimated, this will vary\nif you change your location or weight'),
            Gap(24.h),
            SizedBox(
              width: double.infinity,
              child: AppButton(
                text: 'Back to home',
                onTap: ()=> Navigator.pop(context),
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
