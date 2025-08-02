import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meditation_center/core/firebase/firebase_options.dart';
import 'package:meditation_center/routing/app.routing.dart';
import 'package:meditation_center/core/theme/app.theme.dart';
import 'package:device_preview/device_preview.dart';
 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) =>  MyApp(),
      ),
  );
  // runApp(
  //   DevicePreview(
  //     enabled: false,
  //     builder: (context) => MultiProvider(
  //       providers: [
  //         // providers
  //       ],
  //       child: MyApp(),
  //     ),
  //   ),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            title: 'Mediation Center',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            routerConfig: AppRouting().appRouter,
          );
        });
  }
}
