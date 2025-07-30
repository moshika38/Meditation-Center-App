import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_center/components/app.buttons.dart';
import 'package:meditation_center/components/app.input.dart';
import 'package:meditation_center/components/user.card.dart';
import 'package:meditation_center/utils/app.colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
              _buildLabel(context, "Phone number"),
              AppInput(
                hintText: "+4 754215395",
                prefixIcon: Icons.phone,
                suffixIcon: Icons.cancel_sharp,
              ),
              const SizedBox(height: 40),
              Center(
                child: AppButtons(
                  text: "Change",
                  isPrimary: false,
                  width: 150,
                  height: 40,
                  icon: Icons.edit_calendar_outlined,
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.logout, size: 30, color: AppColors.whiteColor),
                  const SizedBox(width: 8),
                  Text(
                    "Logout",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColors.whiteColor),
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
