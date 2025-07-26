import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final VoidCallback onTap;
  const HomePage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Menu", style: Theme.of(context).textTheme.bodySmall),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  "See all",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
          Card(
            child: Row(
              children: [
                Image.asset("assets/icons/circle.png", width: 50, height: 50),
                const SizedBox(width: 10),
                Text(
                  "Meditation",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
