import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/routes/routes.dart';
import '../../../common/values/color.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, required this.title, required this.image});

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.pushNamed(context, AppRoutes.settings),
      contentPadding: EdgeInsets.symmetric(horizontal: 25.w),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
      ),
      leading: Container(
        height: 40.w,
        width: 40.w,
        padding: EdgeInsets.all(7.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
          color: AppColors.primaryElement,
        ),
        child: Image.asset("assets/icons/$image"),
      ),
    );
  }
}
