import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_center/components/app.buttons.dart';
import 'package:meditation_center/components/app.input.dart';
import 'package:meditation_center/components/app.logo.dart';
import 'package:meditation_center/core/alerts/app.alerts.dart';
import 'package:meditation_center/core/theme/app.colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child:   Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   SizedBox(height: 20.h),
                  Center(
                    child: AppLogo(
                      width: 100.w,
                      height: 100.h,
                    ),
                  ),
                  Spacer(),
                   
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Sign in to Continue",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                   SizedBox(height: 20.h),
                  AppInput(
                    
                    controller: emailController,
                    hintText: "Email address",
                    prefixIcon: Icons.email_outlined,
                    suffixIcon: Icons.cancel_sharp,
                    onTapIcon: () {
                      setState(() {
                        emailController.clear();
                      });
                    },
                  ),
                   
                   SizedBox(height: 20.h),
                  AppInput(
                    controller: passwordController,
                    obscureText: obscureText,
                    hintText: "Password",
                    prefixIcon: Icons.lock_outline,
                    suffixIcon: !obscureText
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    onTapIcon: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  ),
                   SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.push('/forgot');
                        },
                        child: Text(
                          "Forgot password?",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: AppColors.textColor,
                                  ),
                        ),
                      ),
                    ],
                  ),
                   
                   SizedBox(height: 20.h),
                  AppButtons(
                    isPrimary: true,
                    text: "Login",
                    width: double.infinity,
                    height: 50.h,
                    icon: Icons.login,
                    onTap: () { 
                      context.push('/verify');
                      AppAlerts.showCustomDialog(context: context, message: "message");
                       
                    },
                  ),
                   
                  Spacer(),
                  Center(
                    child: Text(
                      "OR",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.textColor,
                          ),
                    ),
                  ),
                   SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _socialIcon("assets/icons/google.png", 40, 40),
                      _socialIcon("assets/icons/facebook.png", 40, 40),
                      _socialIcon("assets/icons/call.png", 38, 38),
                    ],
                  ),

                  Spacer(),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: AppColors.textColor,
                            ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.push('/create');
                        },
                        child: Text(
                          "Create",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: AppColors.primaryColor,
                                  ),
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

  Widget _socialIcon(String iconPath, double? width, double? height) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Image.asset(
        iconPath,
        width: width ?? 40,
        height: height ?? 40,
      ),
    );
  }
}
