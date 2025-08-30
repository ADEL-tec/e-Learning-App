import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/action_button.dart';
import 'widgets/profile_app_bar.dart';
import 'widgets/profile_image.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final actions = {
    "Settings": "settings.png",
    "Payment details": "credit-card.png",
    "Achievement": "award.png",
    "Love": "heart(1).png",
    "Reminder": "cube.png",
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ProfileAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                ProfileImage(),
                SizedBox(height: 20.h),
                ...List.generate(
                  actions.length,
                  (index) => ActionButton(
                    title: actions.keys.elementAt(index),
                    image: actions.values.elementAt(index),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
