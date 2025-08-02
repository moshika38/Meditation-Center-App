import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_center/components/app.logo.dart';
import 'package:meditation_center/components/app.buttons.dart';
import 'package:meditation_center/core/theme/app.colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05.h,
                ),
                AppLogo(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Image.asset(
                  "assets/logo/header-text.png",
                  width: MediaQuery.of(context).size.width * 0.6,
                  fit: BoxFit.cover,
                ),
                Spacer(),
                AppButtons(
                  isPrimary: false,
                  text: "Get Start",
                  onTap: () {
                    context.push('/login');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
