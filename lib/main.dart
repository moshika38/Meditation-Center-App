import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meditation_center/routing/app.routing.dart';
import 'package:meditation_center/utils/app.theme.dart';
import 'package:device_preview/device_preview.dart';

void main() {
    
  runApp(
    DevicePreview(
      enabled: false,  
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),  
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child) {
        return MaterialApp.router(
          title: 'Mediation Center',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
           routerConfig: AppRouting().appRouter,
        );
      }
    );
  }
}
