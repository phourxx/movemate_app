import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:moniepoint_quiz/core/models/shipment.dart';
import 'package:moniepoint_quiz/features/shipment/widgets/shipment_item_widget.dart';
import 'package:moniepoint_quiz/helpers/colors.dart';
import 'package:moniepoint_quiz/widgets/app_text.dart';

import 'widgets/tab_item_widget.dart';


class ShipmentHistoryView extends HookWidget {
  const ShipmentHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final tabCtrl = useTabController(initialLength: 5);
    final currentStatus = useState('');
    final _shipments = currentStatus.value == '' ? shipments : shipments.where((s) => s.status == currentStatus.value).toList();
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton().animate().slideX(
          begin: -.5, duration: const Duration(milliseconds: 600)
        ),
        title: const Text('Shipment History').animate().slideY(
          begin: .6, duration: const Duration(milliseconds: 300)
        ).fadeIn(duration: const Duration(milliseconds: 300)),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: TabBar(
            isScrollable: true,
            onTap: (index){
              currentStatus.value = tabs[index].value;
            },
            controller: tabCtrl,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.orange,
                  width: 3.h,
                ),
              ),
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
            labelStyle: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
            tabs: tabs.map(
                  (tab) => TabItemWidget(
                text: tab.label,
                count: tab.value == '' ? shipments.length : shipments.where((s) => s.status == tab.value).length,
                selected: tab.value == tabs.firstWhere((t) => t.value == currentStatus.value).value,
              ),
            ).toList(),
          ).animate().slide(
              duration: const Duration(milliseconds: 500),
              begin: const Offset(0.1, -0.1), end: const Offset(0, 0)
          ).fadeIn(
              duration: const Duration(milliseconds: 500)
          ),
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 24.h,
        ),
        itemCount: _shipments.length + 1,
        separatorBuilder: (context, i)=> Gap(24.h),
        itemBuilder: (context, i){
          if (i == 0){
            return const AppText(
              'Shipments',
              size: 24,
              weight: FontWeight.bold,
              color: Colors.black,
            ).animate().slideY(
              begin: .4, duration: const Duration(milliseconds: 300)
            );
          }
          final index = i - 1;
          final shipment = _shipments[index];
          return ShipmentItemWidget(shipment: shipment)
              .animate()
              .slideY(
            delay: Duration(milliseconds: 100 * index),
            duration: const Duration(milliseconds: 400),
            begin: .4,
          ).fadeIn(
            duration: const Duration(milliseconds: 300)
          );
          // return FadeInUp(
          //   preferences: AnimationPreferences(
          //     offset: Duration(milliseconds: 10 * index),
          //     duration: const Duration(milliseconds: 500)
          //   ),
          //   child: ShipmentItemWidget(shipment: shipment),
          // );
        },
      ),
    );
  }
}
