import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:moniepoint_quiz/helpers/colors.dart';
import 'package:moniepoint_quiz/widgets/app_text.dart';

class TabItem{
  final String label;
  final String value;

  const TabItem(this.label, this.value);
}

final tabs = [
  const TabItem('All', ''),
  const TabItem('Completed', 'completed'),
  const TabItem('In progress', 'in-progress'),
  const TabItem('Pending', 'pending'),
  const TabItem('Cancelled', 'cancelled'),
];


class TabItemWidget extends StatelessWidget {
  final String text;
  final int count;
  final bool selected;

  const TabItemWidget({
    super.key,
    required this.text,
    required this.count,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText(text, color: selected ? Colors.white : Colors.white60, ),
          if(count > 0)...[
            Gap(4.w),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              decoration: ShapeDecoration(
                color: selected ? AppColors.orange : Colors.white.withOpacity(.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              child: Transform.translate(
                offset: const Offset(0, -3),
                child: AppText('$count', color: Colors.white, size: 10,),
              ),
            ),
          ]
        ],
      ),
    );
  }
}
