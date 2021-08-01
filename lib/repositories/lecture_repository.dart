import '../services/lecture_service.dart';
import '../models/lecture.dart';

abstract class LectureRepository {
  static Future<List<Lecture>> getAllLectures() async {
    return await LectureService.getLecture();
  }
}
