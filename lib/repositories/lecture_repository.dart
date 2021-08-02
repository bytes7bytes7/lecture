import '../services/server_service.dart';
import '../models/lecture.dart';

abstract class LectureRepository {
  static Future<List<Lecture>> getAllLectures(Map<String, dynamic> data) async {
    return await ServerService.getLectures(data);
  }
  
  static Future<void> uploadLecture(Lecture lecture) async{
    return await ServerService.uploadLecture(lecture);
  }
}
