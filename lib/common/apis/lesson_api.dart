import '../entities/entities.dart';
import '../utils/http_util.dart';

class LessonApi {
  static Future<LessonListResponseEntity> lessonList({
    LessonRequestEntity? params,
  }) async {
    final response = await HttpUtil().post(
      'api/lessonList',
      queryParameters: params?.toJson(),
    );

    return LessonListResponseEntity.fromJson(response);
  }

  static Future<LessonDetailResponseEntity> lessonDetail({
    required LessonRequestEntity params,
  }) async {
    final response = await HttpUtil().post(
      'api/lessonDetail',
      queryParameters: params.toJson(),
    );
    print(response);
    return LessonDetailResponseEntity.fromJson(response);
  }
}
