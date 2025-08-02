import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meditation_center/components/app.buttons.dart';
import 'package:meditation_center/components/app.input.dart';
import 'package:meditation_center/components/app.logo.dart';
import 'package:meditation_center/core/theme/app.colors.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController forgotPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.05.h),
                Center(
                  child: AppLogo(
                    width: 100.w,
                    height: 100.h,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05.h),
                Text(
                  "Forgot Password",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Text(
                  "Enter your email address to receive a link to reset your password.",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02.h),
                AppInput(
                  controller: forgotPasswordController,
                  hintText: "Email address",
                  prefixIcon: Icons.email_outlined,
                  suffixIcon: Icons.cancel_sharp,
                  onTapIcon: () {
                    setState(() {
                      forgotPasswordController.clear();
                    });
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03.h),
                AppButtons(
                  icon: Icons.send  ,
                  isPrimary: true,
                  text: "Send",
                  width: double.infinity,
                  height: 50,
                  onTap: () {
                    // Handle login logic here
                  },
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColors.primaryColor,
                      size: 15,
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Back to login",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: AppColors.primaryColor,
                            ),
                      ),
                    ),
                  ],
                )
              ],
            
          ),
        ),
      ),
    );
  }
}
