import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_center/components/app.buttons.dart';
import 'package:meditation_center/components/app.input.dart';
import 'package:meditation_center/components/user.card.dart';
import 'package:meditation_center/core/alerts/loading.popup.dart';
import 'package:meditation_center/core/theme/app.colors.dart';
import 'package:meditation_center/presentation/screens/auth/services/auth.services.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isSwitch = false;

  logOut() {
    LoadingPopup.show('Logging out...');
    AuthServices.logOut();
    context.pushReplacement('/login');
    EasyLoading.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: const Icon(
            Icons.arrow_back,
            size: 16,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'Account settings',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: AppColors.whiteColor),
        ),
      ),
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              Center(child: UserCard()),
              const SizedBox(height: 20),
              _buildLabel(context, "User name"),
              AppInput(
                hintText: "Jone Doe",
                prefixIcon: Icons.person,
                suffixIcon: Icons.cancel_sharp,
              ),
              const SizedBox(height: 10),
              _buildLabel(context, "Email address"),
              AppInput(
                hintText: "user@gmail.com",
                prefixIcon: Icons.email,
                suffixIcon: Icons.cancel_sharp,
              ),
              const SizedBox(height: 40),
              Center(
                child: AppButtons(
                  text: "Change",
                  isPrimary: false,
                  width: double.infinity,
                  height: 50,
                  icon: Icons.edit_calendar_outlined,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    !isSwitch ? "Switch to admin" : "Switch to user ",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColors.whiteColor),
                  ),
                  const SizedBox(width: 20),
                  Switch(
                    value: isSwitch,
                    onChanged: (bool value) {
                      setState(
                        () {
                          isSwitch = value;
                        },
                      );
                    },
                    activeColor: AppColors.whiteColor,
                    inactiveThumbColor: Colors.grey,
                  ),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.logout, size: 30, color: AppColors.whiteColor),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      logOut();
                    },
                    child: Text(
                      "Logout",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.whiteColor),
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

  Widget _buildLabel(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: AppColors.whiteColor),
      ),
    );
  }
}
