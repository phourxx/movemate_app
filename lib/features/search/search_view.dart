import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:moniepoint_quiz/core/models/shipment.dart';
import 'package:moniepoint_quiz/widgets/app_container.dart';
import 'package:moniepoint_quiz/widgets/app_search_field.dart';
import 'package:moniepoint_quiz/widgets/app_text.dart';

class SearchView extends HookWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final query = useState('');
    final _shipments = shipments.where(
      (s) => s.reference.toLowerCase().contains(query.value.toLowerCase())
    ).toList();
    final animCtrl1 = useAnimationController();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          child: Row(
            children: [
              BackButton(
                color: Colors.white,
                onPressed: (){
                  Future.any([
                    // animCtrl.reverse(),
                    animCtrl1.reverse()
                  ]).then((value) => Navigator.pop(context));
                },
              ).animate().slideX(
                delay: const Duration(milliseconds: 200),
                begin: -.2
              ).show(delay: const Duration(milliseconds: 100)),
              // Gap(16.w),
              Expanded(
                child: AppSearchField(
                  readonly: false,
                  onChanged: (v)=> query.value = v,
                ).animate(controller: animCtrl1).slide(
                  begin: const Offset(-.1, .8)
                ),
              )
            ],
          ),
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 24.h,
        ),
        itemBuilder: (context, i) => AppContainer(
          showTopRadius: i == 0,
          showBottomRadius: i == _shipments.length-1,
          child: ListTile(
            // dense: true,
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
            ),
            title: AppText(
              _shipments[i].product,
              weight: FontWeight.bold,
            ),
            subtitle: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppText(_shipments[i].reference, size: 14, color: Colors.grey,),
                Gap(4.w),
                Icon(Icons.brightness_1, size: 6.sp, color: Colors.grey),
                Gap(4.w),
                const AppText('Barcelona', size: 14, color: Colors.grey,),
                Gap(4.w),
                Icon(Icons.arrow_forward, size: 10.sp, color: Colors.grey,),
                Gap(4.w),
                const AppText('Paris', size: 14, color: Colors.grey,),
              ],
            ),
          ).animate().slideY(
            delay: Duration(milliseconds: 50*i),
            begin: .6,
          ),
        ),
        separatorBuilder: (_, i) => ColoredBox(
          color: Colors.white,
          child: Divider(
            color: Colors.grey[300],
            // height: 24.h,
            thickness: 1.h,
            indent: 20.w,
            endIndent: 20.w,
          ).animate().slideY(
            delay: Duration(milliseconds: 50*i),
            begin: .6,
          ),
        ),
        itemCount: _shipments.length,
      ).animate().slideY(
        begin: .1,
      ).fadeIn(),
    );
  }
}
