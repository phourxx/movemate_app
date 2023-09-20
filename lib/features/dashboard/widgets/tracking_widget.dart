import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:moniepoint_quiz/helpers/colors.dart';
import 'package:moniepoint_quiz/helpers/extensions/string_extensions.dart';
import 'package:moniepoint_quiz/widgets/app_container.dart';
import 'package:moniepoint_quiz/widgets/app_text.dart';

class TrackingWidget extends StatelessWidget {

  const TrackingWidget({super.key});

  Widget _title(String text) => AppText(
    text,
    color: Colors.grey,
    weight: FontWeight.w600,
  );
  Widget _subtitle(String text) => AppText(
    text,
    weight: FontWeight.w600,
  );

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      button: TextButton.icon(
        onPressed: (){},
        icon: const Icon(Icons.add, color: AppColors.orange,),
        label: const AppText('Add Stop', color: AppColors.orange,),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const AppText('Shipment Number'),
                      Gap(8.h),
                      const AppText('ABC1234545654', weight: FontWeight.bold,),
                    ],
                  ),
                ),
                Image.asset('tracking_truck'.png, width: 48.w,)
              ],
            ),
            Divider(color: Colors.grey[200], height: 48.h),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: Image.asset('outgoing_box'.png, width: 36.w),
                        title: _title('Sender'),
                        subtitle: _subtitle('Atlanta, 234'),
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                      ListTile(
                        leading: Image.asset('incoming_box'.png, width: 36.w),
                        title: _title('Receiver'),
                        subtitle: _subtitle('Chicago, 234'),
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ],
                  ),
                ),
                Gap(24.w),
                Expanded(
                  child: Column(
                    children: [
                      ListTile(
                        title: _title('Time'),
                        subtitle: Row(
                          children: [
                            Icon(Icons.brightness_1, size: 8.sp, color: Colors.green,),
                            Gap(4.w),
                            _subtitle('Atlanta, 234')
                          ],
                        ),
                        dense: true,
                      ),
                      ListTile(
                        title: _title('Status'),
                        subtitle: _subtitle('Atlanta, 234'),
                        dense: true,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
