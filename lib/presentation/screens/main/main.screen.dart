import 'package:flutter/material.dart';
import 'package:meditation_center/presentation/pages/booking/booking.page.dart';
import 'package:meditation_center/presentation/pages/home/home.page.dart';
import 'package:meditation_center/presentation/pages/notification/notification.page.dart';
import 'package:meditation_center/presentation/pages/play/playlist.page.dart';
import 'package:meditation_center/presentation/pages/post/post.page.dart';
import 'package:meditation_center/utils/app.colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // number of tabs
      child: Builder(
        builder: (BuildContext innerContext) {
          final controller = DefaultTabController.of(innerContext);
          return Scaffold(
            appBar: AppBar(
              title: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Mediation center',
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.account_circle),
                    color: AppColors.whiteColor,
                    iconSize: 40,
                  ),
                ),
              ],
              bottom: const TabBar(
                labelColor: AppColors.whiteColor,
                dividerColor: AppColors.primaryColor,
                automaticIndicatorColorAdjustment: true,
                unselectedLabelColor: AppColors.secondaryColor,
                indicatorColor: AppColors.primaryColor,
                tabs: [
                  Tab(icon: Icon(Icons.home_rounded, size: 25)),
                  Tab(icon: Icon(Icons.video_library_rounded, size: 25)),
                  Tab(icon: Icon(Icons.add_circle_rounded, size: 25)),
                  Tab(icon: Icon(Icons.calendar_month_rounded, size: 25)),
                  Tab(icon: Icon(Icons.notifications, size: 25)),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                // HomePage
                HomePage(
                  onTap: () {
                    controller.animateTo(3);
                  },
                ),
                // PlaylistPage
                PlaylistPage(),
                
                // PostPage
                PostPage(),

                // BookingPage
                BookingPage(),

                // NotificationPage
                NotificationPage(),
              ],
            ),
          );
        },
      ),
    );
  }
}
