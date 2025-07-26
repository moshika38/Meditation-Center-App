import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_center/components/app.buttons.dart';
import 'package:meditation_center/components/app.input.dart';
import 'package:meditation_center/components/app.logo.dart';
import 'package:meditation_center/utils/app.colors.dart';

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
                  "Create Your Account",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                AppInput(
                  controller: nameController,
                  hintText: "Full name",
                  prefixIcon: Icons.email_outlined,
                  suffixIcon: Icons.cancel_sharp,
                  onTapIcon: () {
                    setState(() {
                      nameController.clear();
                    });
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                AppInput(
                  controller: passwordController,
                  obscureText: obscureText1,
                  hintText: "Password",
                  prefixIcon: Icons.lock_outline,
                  suffixIcon: !obscureText1
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  onTapIcon: () {
                    setState(() {
                      obscureText1 = !obscureText1;
                    });
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                AppInput(
                  controller: conformPasswordController,
                  obscureText: obscureText2,
                  hintText: "Confirm Password",
                  prefixIcon: Icons.lock_outline,
                  suffixIcon: !obscureText2
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  onTapIcon: () {
                    setState(() {
                      obscureText2 = !obscureText2;
                    });
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                      "Agree with t & c",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.textColor,
                          ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                AppButtons(
                  isPrimary: true,
                  text: "Create",
                  width: double.infinity,
                  height: 50,
                  onTap: () {
                    // Handle login logic here
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.11),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.textColor,
                          ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
