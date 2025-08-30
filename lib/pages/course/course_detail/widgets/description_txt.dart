import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/values/color.dart';

class DescriptionTxt extends StatelessWidget {
  const DescriptionTxt(this.description, {super.key});
  final String description;
  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: TextStyle(
        color: AppColors.primaryThreeElementText,
        fontSize: 11.sp,
      ),
    );
  }
}
