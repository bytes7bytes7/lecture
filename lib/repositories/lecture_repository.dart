import '../models/lecture.dart';
import '../services/server_service.dart';

abstract class LectureRepository {
  static Future<List<Lecture>> getAllLectures(Map<String, dynamic> data) async {
    return ServerService.getLectures(data);
  }
  
  static Future<void> uploadLecture(Lecture lecture) async{
    return ServerService.uploadLecture(lecture);
  }
}
