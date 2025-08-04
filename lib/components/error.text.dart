import 'package:flutter/material.dart';

class AppErrorText extends StatelessWidget {
  final String text;
  final double? hSpace;
  final double? vSpace;
  final bool? isWhiteText;
  const AppErrorText({super.key, required this.text, this.hSpace, this.vSpace, this.isWhiteText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: vSpace ?? 5, horizontal: hSpace ?? 10),
      child: Text(
        "${text}",
        style: TextStyle(
          fontSize: 12,
        color:isWhiteText??false?Colors.white:Colors.red,
        fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
