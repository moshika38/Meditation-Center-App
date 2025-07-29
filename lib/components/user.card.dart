import 'package:flutter/material.dart';
import 'package:meditation_center/utils/app.colors.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 130,
      child: Stack(
        children: [
          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                "https://randomuser.me/api/portraits/men/1.jpg",
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.9, 0.9),
            child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 40,
                  color: AppColors.whiteColor,
                )),
          ),
        ],
      ),
    );
  }
}
