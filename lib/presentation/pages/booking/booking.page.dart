import 'package:flutter/material.dart';
import 'package:meditation_center/components/app.buttons.dart';
import 'package:meditation_center/components/booking.card.dart';
 
class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: AppButtons(
                    text: "Add",
                    isPrimary: true,
                    width: 100,
                    height: 33,
                    icon: Icons.add,
                  ),
                ),
              ],
            ),
            ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return BookingCard(
                    text:
                        "ශ්‍රී ලංකා භාවනා මධ්‍යස්ථානයේ උදෑසන දානය භාර ගැනීම සදහා ");
              },
            )
          ],
        ),
      ),
    );
  }
}
