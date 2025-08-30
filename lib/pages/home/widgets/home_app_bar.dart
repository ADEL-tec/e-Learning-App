import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/constants.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key, this.avatar});
  final String? avatar;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Padding(
        padding: EdgeInsets.all(7.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 12.h,
              width: 15.w,
              child: Image.asset("assets/icons/menu.png"),
            ),
            GestureDetector(
              child: Container(
                clipBehavior: Clip.antiAlias,
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(50.w),
                  image: avatar != null
                      ? DecorationImage(
                          image: NetworkImage(
                            "${AppConstants.SERVER_API_URL}$avatar",
                          ),
                        )
                      : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
