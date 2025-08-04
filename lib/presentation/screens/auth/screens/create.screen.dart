import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_center/components/app.buttons.dart';
import 'package:meditation_center/components/app.input.dart';
import 'package:meditation_center/components/app.logo.dart';
import 'package:meditation_center/core/theme/app.colors.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  bool obscureText1 = true;
  bool obscureText2 = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conformPasswordController = TextEditingController();
  bool isAgree = true;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               
              SizedBox(height: height * 0.03),

              Center(
                child: AppLogo(
                  width: 100,
                  height: 100,
                ),
              ),

              SizedBox(height: height * 0.05),

              Text(
                "Create Your Account",
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              SizedBox(height: height * 0.02),

              AppInput(
                controller: nameController,
                hintText: "Full name",
                prefixIcon: Icons.person_outline,
                suffixIcon: Icons.cancel_sharp,
                onTapIcon: () {
                  setState(() {
                    nameController.clear();
                  });
                },
              ),
              // AppErrorText(text: "Please enter name"),

              SizedBox(height: height * 0.02),

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
              // AppErrorText(text: "Please enter email"),

              SizedBox(height: height * 0.02),

              AppInput(
                controller: passwordController,
                obscureText: obscureText1,
                hintText: "Password",
                prefixIcon: Icons.lock_outline,
                suffixIcon: obscureText1
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                onTapIcon: () {
                  setState(() {
                    obscureText1 = !obscureText1;
                  });
                },
              ),
              // AppErrorText(text: "Please enter password"),

              SizedBox(height: height * 0.02),

              AppInput(
                controller: conformPasswordController,
                obscureText: obscureText2,
                hintText: "Confirm Password",
                prefixIcon: Icons.lock_outline,
                suffixIcon: obscureText2
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                onTapIcon: () {
                  setState(() {
                    obscureText2 = !obscureText2;
                  });
                },
              ),
              // AppErrorText(text: "Please confirm password"),

              SizedBox(height: height * 0.02),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    side: BorderSide(
                      color: AppColors.primaryColor,
                      width: 2,
                    ),
                    activeColor: AppColors.primaryColor,
                    value: isAgree,
                    onChanged: (value) {
                      setState(() {
                        isAgree = value ?? false;
                      });
                    },
                  ),
                  Text(
                    "Agree with T & C",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.textColor,
                        ),
                  ),
                ],
              ),

              SizedBox(height: height * 0.02),

              AppButtons(
                isPrimary: true,
                text: "Create",
                width: double.infinity,
                height: 50,
                icon: Icons.done_all_outlined,
                onTap: () {
                  // Handle account creation
                },
              ),

              SizedBox(height: height * 0.05),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.textColor,
                        ),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      context.push('/login');
                    },
                    child: Text(
                      "Login",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.primaryColor,
                          ),
                    ),
                  ),
                ],
              ),
SizedBox(height: height * 0.02),
               
            ],
          ),
        ),
      ),
    );
  }
}

