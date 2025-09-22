import '../signin/sign_in.dart';
import '../signin/sign_in_controller.dart';
import 'auth_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThirdPartyAuth extends StatelessWidget {
  const ThirdPartyAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 18.h, bottom: 18.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildSocialBtn(context, iconName: "google", type: AuthType.google),
          SizedBox(width: 25.w),
          _buildSocialBtn(context, iconName: "apple", type: AuthType.apple),
          SizedBox(width: 25.w),
          _buildSocialBtn(
            context,
            iconName: "facebook",
            type: AuthType.facebook,
          ),
        ],
      ),
    );
  }

  GestureDetector _buildSocialBtn(
    BuildContext context, {
    required String iconName,
    required AuthType type,
  }) {
    return GestureDetector(
      onTap: () {
        SignInController(context: context).handleSignIn(type);
      },
      child: SizedBox(
        height: 40.w,
        width: 40.w,
        child: Image.asset("assets/icons/$iconName.png"),
      ),
    );
  }
}
