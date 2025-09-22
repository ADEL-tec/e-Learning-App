import '../bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/color.dart';

class ProfileName extends StatelessWidget {
  const ProfileName(this.state, {super.key});

  final ProfileState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 50.w),
      child: Text(
        state.userItem == null
            ? "No Name Found"
            : state.userItem?.description ?? 'No Name Given',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12.sp,
          color: AppColors.primarySecondaryElementText,
        ),
      ),
    );
  }
}
