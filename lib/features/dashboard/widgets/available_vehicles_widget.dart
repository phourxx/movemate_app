import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:moniepoint_quiz/helpers/extensions/string_extensions.dart';
import 'package:moniepoint_quiz/widgets/app_container.dart';
import 'package:moniepoint_quiz/widgets/app_text.dart';

class AvailableVehicle{
  final String name;
  final String type;
  final String image;

  const AvailableVehicle({
    required this.name,
    required this.type,
    required this.image,
  });
}

class AvailableVehiclesWidget extends StatelessWidget {
  const AvailableVehiclesWidget({super.key});


  @override
  Widget build(BuildContext context) {
    final vehicles = [
      AvailableVehicle(
        name: 'Ocean Freight',
        type: 'International',
        image: 'ocean_freight'.png,
      ),
      AvailableVehicle(
        name: 'Cargo Freight',
        type: 'Reliable',
        image: 'cargo_freight'.png,
      ),
      AvailableVehicle(
        name: 'Air Freight',
        type: 'International',
        image: 'ocean_freight'.png,
      ),
    ];
    return SizedBox(
      height: 220.h,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: vehicles.length,
        itemBuilder: (context, i) => Stack(
          children: [
            AppContainer(
              elevate: false,
              width: 150.w,
              // image: vehicles[i].image,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 24.h,
                  horizontal: 16.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppText(vehicles[i].name, size: 16, weight: FontWeight.w700),
                    AppText(vehicles[i].type, size: 14, color: Colors.grey, weight: FontWeight.w600),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(vehicles[i].image, width: 150.w,).animate().slideX(
                begin: .5, duration: const Duration(milliseconds: 400)
              ),
            )
          ],
        ),
        separatorBuilder: (_, __)=> Gap(16.w),
      ),
    );
  }
}
