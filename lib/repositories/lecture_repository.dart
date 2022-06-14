import 'package:quick_quotes_quill/spread_quill_manager.dart';
import 'package:rest_client/rest_client.dart';

abstract class LectureRepository {
  static Future<List<Lecture>> getAllLectures(Map<String, dynamic> data) async {
    SpreadQuillManager.inst.info('getAllLectures');
    return [];
  }

  static Future<void> uploadLecture(Lecture lecture) async {
    SpreadQuillManager.inst.info('uploadLecture');
    return;
  }
}
