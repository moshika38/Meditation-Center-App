import 'package:flutter/material.dart';
import 'package:meditation_center/core/theme/app.colors.dart';

class ScaffoldMessages {
  void showCustomDialog(
    BuildContext context,
    String message,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.error,
              color: AppColors.whiteColor,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                'Login failed. Please try again. you can try again after few moments',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.whiteColor,
                    ),
              ),
            ),
             TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              child: Text(
                "Undo",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.whiteColor,
                    ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        duration: Duration(seconds: 3),
      ),
    );
  }
}
