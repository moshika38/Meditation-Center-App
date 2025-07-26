import 'package:flutter/material.dart';
import 'package:meditation_center/routing/app.routing.dart';
import 'package:meditation_center/utils/app.theme.dart';

void main() {
    
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Mediation Center',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
       routerConfig: AppRouting().appRouter,
    );
  }
}
