import '../entities/entities.dart';
import '../utils/http_util.dart';

class CourseApi {
  static Future<CourseListResponseEntity> courseList() async {
    final response = await HttpUtil().post('api/courseList');

    return CourseListResponseEntity.fromJson(response);
  }

  static Future<CourseDetailResponseEntity> courseDetail({
    required CourseRequestEntity params,
  }) async {
    final response = await HttpUtil().post(
      'api/courseDetail',
      queryParameters: params.toJson(),
    );
    print(response);
    return CourseDetailResponseEntity.fromJson(response);
  }

  static Future<BaseResponseEntity> coursePay({
    required CourseRequestEntity params,
  }) async {
    final response = await HttpUtil().post(
      'api/checkout',
      queryParameters: params.toJson(),
    );
    print(response);
    return BaseResponseEntity.fromJson(response);
  }
}
