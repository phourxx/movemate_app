import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:moniepoint_quiz/features/calculate/calculate_view.dart';
import 'package:moniepoint_quiz/features/search/search_view.dart';
import 'package:moniepoint_quiz/features/shipment/shipment_history_view.dart';
import 'package:moniepoint_quiz/helpers/custom_route.dart';
import 'package:moniepoint_quiz/widgets/app_search_field.dart';
import 'package:moniepoint_quiz/widgets/app_text.dart';

import 'widgets/available_vehicles_widget.dart';
import 'widgets/tracking_widget.dart';


class DashboardView extends HookWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final tabCtrl = useTabController(initialLength: 4);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
          ),
          child: const CircleAvatar(backgroundColor: Colors.grey),
        ),
        centerTitle: false,
        titleSpacing: 0,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Transform.rotate(
                  angle: -45,
                  child: Icon(
                    Icons.send_rounded,
                    size: 14.sp,
                    color: Colors.grey[350],
                  ),
                ),
                Gap(4.w),
                AppText(
                  'Your location',
                  color: Colors.grey[350],
                  size: 16,
                  weight: FontWeight.w500,
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AppText(
                  'Folayemi, Bello',
                  color: Colors.white,
                  size: 16,
                  weight: FontWeight.bold,
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 20.sp,
                  color: Colors.grey[350],
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20.r,
              child: const Icon(
                Icons.notifications_none_rounded,
                color: Colors.black,
              ),
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100.h),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 24.h,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: AppSearchField(
              readonly: false,
              onTap: ()=> Navigator.push(context, fadeInRoute((context) => const SearchView())),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const AppText('Tracking', size: 18, weight: FontWeight.bold,),
                Gap(24.h),
                const TrackingWidget()
              ],
            ).animate().slideY(
                begin: .5, duration: const Duration(milliseconds: 300)
            ),
            Gap(36.h),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const AppText(
                  'Available vehicles',
                  size: 18,
                  weight: FontWeight.bold,
                ),
                Gap(24.h),
                const AvailableVehiclesWidget()
              ],
            ).animate().slideY(
                delay: const Duration(milliseconds: 50),
                begin: .3, duration: const Duration(milliseconds: 300)
            ).fadeIn(
                duration: const Duration(milliseconds: 300)
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: TabBar(
          onTap: (index){
            if(index == 1){
              Navigator.push(
                context,
                fadeInRoute((_) => const CalculateView()),
              );
            }else if(index == 2){
              Navigator.push(
                context,
                fadeInRoute((_) => const ShipmentHistoryView()),
              );
            }
            tabCtrl.index = 0;
          },
          controller: tabCtrl,
          indicatorSize: TabBarIndicatorSize.tab,
          unselectedLabelStyle: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
          labelStyle: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
          indicator: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 5.h,
              ),
            ),
          ),
          tabs: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Gap(16.h),
                const Icon(Icons.home_outlined),
                const Text('Home'),
                Gap(16.h),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Gap(16.h),
                const Icon(Icons.calculate_outlined),
                const Text('Calculate'),
                Gap(16.h),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Gap(16.h),
                const Icon(Icons.history_rounded),
                const Text('Shipment'),
                Gap(16.h),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Gap(16.h),
                const Icon(Icons.person_2_outlined),
                const Text('Profile'),
                Gap(16.h),
              ],
            ),
          ],
        ),
      ).animate().slideY(
        begin: .4
      ),
    );
  }
}
