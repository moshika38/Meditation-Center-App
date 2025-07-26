import 'package:flutter/material.dart';
import 'package:meditation_center/utils/app.colors.dart';

class SecondaryButtons extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final VoidCallback? onTap;


  const SecondaryButtons({super.key, required this.text,   this.width,   this.height, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width?? MediaQuery.of(context).size.width * 0.6,
        height: height?? 60,
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
               text,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.whiteColor,
                    ),
              ),
              SizedBox(width: 10,),
              Icon(Icons.arrow_forward_ios_rounded, color: AppColors.whiteColor,size: 18,),
            ],
          ),
        ),
      ),
    );
  }
}
