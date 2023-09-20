import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:moniepoint_quiz/core/models/shipment.dart';
import 'package:moniepoint_quiz/widgets/app_text.dart';

class StatusCapsuleWidget extends StatelessWidget {
  final Shipment shipment;
  const StatusCapsuleWidget({super.key, required this.shipment});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 4.h,
      ),
      alignment: Alignment.center,
      decoration: ShapeDecoration(
          color: Colors.grey.withOpacity(.2),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r)
          )
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(shipment.iconData, color: shipment.color, size: 16.sp,),
          Gap(4.w),
          AppText(shipment.status, color: shipment.color, weight: FontWeight.bold,),
        ],
      ),
    );
  }
}
