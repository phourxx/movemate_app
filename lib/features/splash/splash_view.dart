import 'package:flutter/material.dart';
import 'package:moniepoint_quiz/widgets/app_text.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: AppText('Shipments App'),
      ),
    );
  }
}
