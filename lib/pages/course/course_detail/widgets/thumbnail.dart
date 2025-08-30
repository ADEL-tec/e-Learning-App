import '../../../../common/values/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Thumbnail extends StatelessWidget {
  const Thumbnail(this.image, {super.key});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: NetworkImage('${AppConstants.SERVER_UPLOADS}$image'),
        ),
      ),
    );
  }
}
