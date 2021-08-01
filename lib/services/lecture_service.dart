import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lecture/models/lecture.dart';

import '../security/uri.dart';

abstract class LectureService {
  static Future<List<Lecture>> getLecture() async {
    var client = http.Client();
    http.Response uriResponse;
    try {
      uriResponse = await client.get(Uri.parse(ServerURI.lectureUri));
    } finally {
      client.close();
    }
    var body = json.decode(utf8.decode(uriResponse.bodyBytes));
    List<Lecture> lectures = [];
    for(Map<String, dynamic> m in body){
      lectures.add(Lecture.fromMap(m));
    }
    return lectures;
  }
}
