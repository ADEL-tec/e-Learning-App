import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/values/color.dart';

class CourseSummary extends StatefulWidget {
  const CourseSummary({
    super.key,
    required this.videoLength,
    required this.lessonNum,
    required this.downNum,
  });

  final int videoLength;
  final int lessonNum;
  final int downNum;
  @override
  State<CourseSummary> createState() => _CourseSummaryState();
}

class _CourseSummaryState extends State<CourseSummary> {
  late Map<String, String> infos;

  @override
  void initState() {
    super.initState();
    infos = {
      "${widget.videoLength} Hours Video": "video_detail.png",
      "Total ${widget.lessonNum} Lessons": "file_detail.png",
      "${widget.downNum} downloadable Resources": "download_detail.png",
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List<dynamic>.generate(infos.values.length, (index) {
          final title = infos.keys.elementAt(index);
          final image = infos.values.elementAt(index);
          return _buildListView(image: image, title: title);
        }),
      ],
    );
  }

  Widget _buildListView({required String title, required String image}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        height: 35.w,
        width: 35.w,
        // padding: EdgeInsets.all(5.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.w),
          color: AppColors.primaryElement,
        ),
        child: Image.asset("assets/icons/$image", height: 30.w, width: 30.w),
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11.sp),
      ),
    );
  }
}
