import 'package:flutter/material.dart';

class AppAlerts {
  static void showCustomDialog({
    required BuildContext context,
    double top = 100,
    double left = 50,
    required String message,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Positioned(
              top: top,
              left: left,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(2, 2),
                      )
                    ],
                  ),
                  child: Text(message),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
