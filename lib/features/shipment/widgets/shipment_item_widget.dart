import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:moniepoint_quiz/core/models/shipment.dart';
import 'package:moniepoint_quiz/helpers/extensions/string_extensions.dart';
import 'package:moniepoint_quiz/widgets/app_container.dart';
import 'package:moniepoint_quiz/widgets/app_text.dart';

import 'status_capsule_widget.dart';

class ShipmentItemWidget extends StatelessWidget {
  final Shipment shipment;
  const ShipmentItemWidget({super.key, required this.shipment});

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      elevate: false,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [StatusCapsuleWidget(shipment: shipment)]),
                Gap(10.h),
                const AppText(
                  'Arriving today!',
                  size: 18,
                  weight: FontWeight.bold,
                  color: Colors.black,
                ),
                Gap(8.h),
                AppText(
                  'Your delivery ${shipment.reference} form Atlanta is arriving today!',
                  size: 12,
                  height: 12,
                  color: Colors.grey,
                ),
                Gap(16.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppText(
                      '\$${shipment.amount} USD',
                      color: Theme.of(context).primaryColor,
                      weight: FontWeight.bold,
                    ),
                    Gap(4.w),
                    Icon(
                      Icons.brightness_1,
                      size: 6.sp,
                      color: Colors.grey[300],
                    ),
                    Gap(4.w),
                    const AppText(
                      'Sept 18, 2023',
                      color: Colors.black,
                      weight: FontWeight.w600,
                      size: 12,
                    ),
                  ],
                )
              ],
            ),
          ),
          Gap(24.w),
          Image.asset('box'.png, width: 56.w,)
        ],
      ),
    );
  }
}
