import 'package:flutter/material.dart';
import 'package:meditation_center/components/app.buttons.dart';
import 'package:meditation_center/components/app.input.dart';
import 'package:meditation_center/components/app.logo.dart';
import 'package:meditation_center/utils/app.colors.dart';

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Center(
                  child: AppLogo(
                    width: 100,
                    height: 100,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Text(
                  "Forgot Password",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Text(
                  "Enter your email address to receive a link to reset your password.",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.25),
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
      ),
    );
  }
}
