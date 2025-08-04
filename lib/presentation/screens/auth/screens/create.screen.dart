import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_center/components/app.buttons.dart';
import 'package:meditation_center/components/app.input.dart';
import 'package:meditation_center/components/app.logo.dart';
import 'package:meditation_center/core/alerts/scaffold.messages.dart';

import 'package:meditation_center/core/theme/app.colors.dart';
import 'package:meditation_center/presentation/screens/auth/services/auth.services.dart';

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

  bool isNameError = false;
  bool isEmailError = false;
  bool isPassError = false;
  bool isComPassError = false;

  void create() async {
    if (nameController.text.isEmpty) {
      isNameError = true;
      setState(() {});
    } else {
      isNameError = false;
      setState(() {});
    }
    if (emailController.text.isEmpty) {
      isEmailError = true;
      setState(() {});
    } else {
      isEmailError = false;
      setState(() {});
    }
    if (passwordController.text.isEmpty) {
      isPassError = true;
      setState(() {});
    } else {
      isPassError = false;
      setState(() {});
    }
    if (conformPasswordController.text.isEmpty) {
      isComPassError = true;
      setState(() {});
    } else {
      isComPassError = false;
      setState(() {});
    }

    // continue create account
    if (!isNameError && !isEmailError && !isPassError && !isComPassError) {
      final status = await AuthServices.createAccountWithEmailAndPassword(
          emailController.text, passwordController.text);
      if (!mounted) return;

      if (status == "The account already exists for that email") {
        ScaffoldMessages().showCustomDialog(
            context, "The account already exists for that email");
      } else if (status == "The password provided is too weak") {
        ScaffoldMessages()
            .showCustomDialog(context, "The password provided is too weak");
      } else {
        context.push('/verify');
      }
    }
  }

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
              SizedBox(height: 20),
              Center(
                child: AppLogo(
                  width: 100,
                  height: 100,
                ),
              ),
              Spacer(),
              Text(
                "Create Your Account",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 20),
              AppInput(
                hasError: isNameError,
                controller: nameController,
                hintText: isNameError ? "Please enter your name" : "Full name",
                prefixIcon: Icons.email_outlined,
                suffixIcon: Icons.cancel_sharp,
                onTapIcon: () {
                  setState(() {
                    nameController.clear();
                  });
                },
              ),
              SizedBox(height: 20),
              AppInput(
                hasError: isEmailError,
                controller: emailController,
                hintText: isEmailError
                    ? "Please enter your email address"
                    : "Email address",
                prefixIcon: Icons.email_outlined,
                suffixIcon: Icons.cancel_sharp,
                onTapIcon: () {
                  setState(() {
                    emailController.clear();
                  });
                },
              ),
              SizedBox(height: 20),
              AppInput(
                hasError: isPassError,
                controller: passwordController,
                obscureText: obscureText1,
                hintText:
                    isPassError ? "Please enter your password" : "Password",
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
              SizedBox(height: 20),
              AppInput(
                hasError: isComPassError,
                controller: conformPasswordController,
                obscureText: obscureText2,
                hintText: isComPassError
                    ? "Please confirm your password"
                    : "Confirm Password",
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
              SizedBox(height: 20),
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
              SizedBox(height: 20),
              AppButtons(
                isPrimary: true,
                text: "Create",
                width: double.infinity,
                height: 50,
                icon: Icons.done_all_outlined,
                onTap: () {
                  // create();
                 
                },
              ),
              Spacer(),
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
    );
  }
}
