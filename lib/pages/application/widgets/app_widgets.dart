import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/home_page.dart';
import '../../profile/profile_page.dart';

Widget buildPage(int index) {
  List<Widget> widgets = [
    HomePage(),
    Center(child: Text("Search")),
    Center(child: Text("Course")),
    Center(child: Text("Chat")),
    ProfilePage(),
  ];

  return widgets[index];
}

List<Widget> bottomTabs = [
  NavigationDestination(
    selectedIcon: SizedBox(
      width: 15.w,
      height: 15.w,
      child: Image.asset("assets/icons/home.png", color: Colors.white),
    ),
    icon: SizedBox(
      width: 15.w,
      height: 15.w,
      child: Image.asset("assets/icons/home.png"),
    ),
    label: 'Home',
  ),
  NavigationDestination(
    selectedIcon: SizedBox(
      width: 15.w,
      height: 15.w,
      child: Image.asset("assets/icons/search2.png", color: Colors.white),
    ),
    icon: SizedBox(
      width: 15.w,
      height: 15.w,
      child: Image.asset("assets/icons/search2.png"),
    ),
    label: 'Search',
  ),
  NavigationDestination(
    selectedIcon: SizedBox(
      width: 15.w,
      height: 15.w,
      child: Image.asset("assets/icons/play-circle1.png", color: Colors.white),
    ),
    icon: SizedBox(
      width: 15.w,
      height: 15.w,
      child: Image.asset("assets/icons/play-circle1.png"),
    ),
    label: 'Course',
  ),
  NavigationDestination(
    selectedIcon: SizedBox(
      width: 15.w,
      height: 15.w,
      child: Image.asset(
        "assets/icons/message-circle.png",
        color: Colors.white,
      ),
    ),
    icon: SizedBox(
      width: 15.w,
      height: 15.w,
      child: Image.asset("assets/icons/message-circle.png"),
    ),
    label: 'Chat',
  ),
  NavigationDestination(
    selectedIcon: SizedBox(
      width: 15.w,
      height: 15.w,
      child: Image.asset("assets/icons/person2.png", color: Colors.white),
    ),
    icon: SizedBox(
      width: 15.w,
      height: 15.w,
      child: Image.asset("assets/icons/person2.png"),
    ),
    label: 'Profile',
  ),
];
