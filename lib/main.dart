import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moniepoint_quiz/helpers/colors.dart';

import 'features/dashboard/dashboard_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      child: MaterialApp(
        title: 'Shipments App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: const Color(0xFF503c96),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          scaffoldBackgroundColor: AppColors.scaffoldBg,
          backgroundColor: AppColors.scaffoldBg,
          appBarTheme: AppBarTheme(
            backgroundColor: const Color(0xFF503c96),
            elevation: 0,
            titleTextStyle: GoogleFonts.encodeSans(
              color: Colors.white,
              // fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
            iconTheme: const IconThemeData(
              color: Colors.white
            )
          ),
          useMaterial3: true,
        ),
        home: const DashboardView(),
        builder: (context, child)=> MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: GestureDetector(
            onTap: () {
              final f = FocusNode();
              Focus.of(context).requestFocus(f);
            },
            child: child,
          ),
        ),
      ),
    );
  }
}
