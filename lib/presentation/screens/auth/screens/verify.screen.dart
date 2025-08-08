import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_center/components/app.buttons.dart';
import 'package:meditation_center/core/alerts/app.loading.dart';
import 'package:meditation_center/core/alerts/app.top.snackbar.dart';
import 'package:meditation_center/presentation/screens/auth/services/auth.services.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    void verify() async {
      EasyLoading.show(
          status: 'Verifying...',
          indicator: AppLoading(),
          maskType: EasyLoadingMaskType.black);

      final result = await AuthServices.isEmailVerified();
      if (result) {
        context.pushReplacement('/main');
        EasyLoading.dismiss();
        EasyLoading.showSuccess('Verified !', duration: Duration(seconds: 2));
      } else {
        EasyLoading.dismiss();
        AppTopSnackbar.showTopSnackBar(context, "Email not verified !");
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.email_outlined,
                size: 80,
                color: theme.primaryColor,
              ),
              SizedBox(height: 32.h),
              Text(
                'Check your inbox',
                style: theme.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              Text(
                'We\'ve sent a verification link to your email address. Please check your inbox and click the link to verify your account.',
                style: theme.textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),
              AppButtons(
                text: "Verify",
                isPrimary: true,
                width: double.infinity,
                height: 50,
                icon: Icons.check,
                onTap: () {
                  verify();
                },
              ),
              SizedBox(height: 50.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back_ios_new_rounded,
                      color: theme.primaryColor, size: 14.h),
                  SizedBox(width: 8.h),
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: Text(
                      'Back to Create Account',
                      style: theme.textTheme.bodySmall!
                          .copyWith(color: theme.primaryColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
