import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/color.dart';
import '../bloc/home_bloc.dart';

class SliderView extends StatelessWidget {
  const SliderView(this.images, {super.key, this.pageIndex});

  final List<String> images;
  final int? pageIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20.h),
          width: double.infinity,
          height: 160.h,
          child: PageView(
            onPageChanged: (value) {
              context.read<HomeBloc>().add(HomeDotsEvent(value));
            },

            children: images.map((e) => _sliderContainer(e)).toList(),
          ),
        ),
        DotsIndicator(
          dotsCount: 3,
          position: pageIndex?.toDouble() ?? 0,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryElement,
            color: AppColors.primaryThreeElementText,
            size: Size.square(5),
            activeSize: Size(16, 5),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(20.w),
            ),
          ),
        ),
      ],
    );
  }

  Widget _sliderContainer(String imageUrl) {
    return Container(
      width: double.infinity,
      height: 160.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        image: DecorationImage(image: AssetImage(imageUrl)),
      ),
    );
  }
}
