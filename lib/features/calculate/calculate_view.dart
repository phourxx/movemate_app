import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:moniepoint_quiz/helpers/extensions/string_extensions.dart';
import 'package:moniepoint_quiz/widgets/app_button.dart';
import 'package:moniepoint_quiz/widgets/app_container.dart';
import 'package:moniepoint_quiz/widgets/app_text.dart';

import 'calculate_success_view.dart';
import 'widgets/input_widget.dart';

class CalculateView extends HookWidget {
  const CalculateView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      'Documents', 'Glass', 'Liquid', 'Food',
      'Electronic', 'Product', 'Others'
    ];
    final selectedCategory = useState('');
    final ctrl = useAnimationController(duration: const Duration(milliseconds: 400));
    final bottomHeight = useAnimation(
      Tween<double>(begin: 100.h, end: 0).animate(
        CurvedAnimation(parent: ctrl, curve: Curves.easeIn),
      ),
    );
    useEffect((){
      ctrl.forward();
      return;
    }, ['once']);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculate').animate().fadeIn(
          duration: const Duration(milliseconds: 300)
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(bottomHeight),
          child: const SizedBox.shrink(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 24.h,
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppText(
                      ctrl.isCompleted ? 'Destination' : '',
                      size: 18,
                      weight: FontWeight.bold,
                    )
                        .animate()
                        .fadeIn(duration: const Duration(milliseconds: 50)
                    ),
                    Gap(16.h),
                    AppContainer(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 24.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const InputWidget(
                              hintText: 'Sender location',
                              icon: Icon(Icons.upload_file_outlined),
                            ).animate().slideY(
                              begin: .2, duration: const Duration(milliseconds: 300),
                            ),
                            Gap(16.h),
                            const InputWidget(
                              hintText: 'Receiver location',
                              icon: Icon(Icons.cloud_download_outlined),
                            ).animate().slideY(
                              begin: .2, duration: const Duration(milliseconds: 400),
                            ),
                            Gap(16.h),
                            const InputWidget(
                              hintText: 'Approved Weight',
                              icon: Icon(Icons.scale_outlined),
                            ).animate().slideY(
                              begin: .2, duration: const Duration(milliseconds: 500),
                            ),
                            Gap(16.h),
                          ],
                        ),
                      ),
                    ),
                    Gap(24.h),
                    const AppText('Packaging', size: 18, weight: FontWeight.bold,),
                    Gap(4.h),
                    const AppText('What are you sending?', size: 18, color: Colors.grey,),
                    Gap(16.h),
                    InputWidget(
                      hintText: 'Approved Weight',
                      fillColor: Colors.white,
                      prefixSize: 48.w,
                      icon: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                        ),
                        child: Image.asset('box_small'.png),
                      ),
                    ),
                    Gap(24.h),
                    const AppText('Categories', size: 18, weight: FontWeight.bold,).animate().slideY(
                      begin: 2, duration: const Duration(milliseconds: 300)
                    ),
                    Gap(4.h),
                    const AppText('What are you sending?', size: 18, color: Colors.grey,).animate().slideY(
                        begin: 2, duration: const Duration(milliseconds: 400)
                    ),
                    Gap(16.h),
                    Wrap(
                      direction: Axis.horizontal,
                      spacing: 16.w,
                      runSpacing: 16.h,
                      children: categories.map((cat) => _CategoryChip(
                        checked: selectedCategory.value == cat,
                        text: cat,
                        onTap: (cat)=> selectedCategory.value = cat,
                      ).animate().slideX(
                        delay: Duration(milliseconds: 50 * categories.indexOf(cat)),
                        begin: .2, duration: const Duration(milliseconds: 300)
                      )).toList(),
                    )
                  ],
                ),
              ),
            ),
            Gap(24.h),
            AppButton(
              text: 'Calculate',
              onTap: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_)=> const CalculateSuccessView()),
                );
              },
            ).animate().slideY(
              begin: .4, duration: const Duration(milliseconds: 300)
            )
          ],
        ),
      ),
    );
  }
}

class _CategoryChip extends HookWidget {
  final bool checked;
  final String text;
  final ValueChanged<String> onTap;

  const _CategoryChip({
    super.key,
    required this.checked,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final scaleCtrl = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );
    return GestureDetector(
      onTap: () {
        scaleCtrl.forward();
        Future.delayed(const Duration(milliseconds: 200), () {
          scaleCtrl.reverse().then((_) => onTap(text));
        });
      },
      child: ScaleTransition(
        scale: Tween<double>(
          begin: 1.0,
          end: 0.7,
        ).animate(scaleCtrl),
        child: AnimatedSize(
          duration: const Duration(milliseconds: 200),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 8.h,
            ),
            // duration: const Duration(milliseconds: 500),
            decoration: ShapeDecoration(
              color: checked ? Colors.black : Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  side: const BorderSide()),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (checked) ...[
                  Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 16.sp,
                  ),
                  Gap(4.w),
                ],
                AppText(
                  text,
                  color: checked ? Colors.white : Colors.black,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
