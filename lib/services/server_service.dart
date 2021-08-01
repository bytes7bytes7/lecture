import 'dart:convert';
import 'package:http/http.dart' as http;

import '../global_parameters.dart';
import '../models/lecture.dart';
import '../security/secret_uri.dart';

abstract class ServerService {
  static Future<List<Lecture>> getLectures(Map<String, dynamic> data) async {
    var client = http.Client();
    http.Response uriResponse;
    try {
      uriResponse =
          await client.post(Uri.parse(SecretURI.lectureUri), body: json.encode(data));
    } finally {
      client.close();
    }
    var body = json.decode(utf8.decode(uriResponse.bodyBytes));
    List<Lecture> lectures = [];
    for (Map<String, dynamic> m in body) {
      lectures.add(Lecture.fromMap(m));
    }
    return lectures;
  }

  static Future<void> getFilterData() async {
    var client = http.Client();
    http.Response uriResponse;
    try {
      uriResponse = await client.get(Uri.parse(SecretURI.filterDataUri));
    } finally {
      client.close();
    }
    var body = json.decode(utf8.decode(uriResponse.bodyBytes));
    GlobalParameters.faculties.clear();
    GlobalParameters.levels.clear();
    GlobalParameters.subjects.clear();
    GlobalParameters.semesters = 0;

    GlobalParameters.faculties.addAll(List<String>.from(body['faculty']));
    GlobalParameters.levels.addAll(List<String>.from(body['level']));
    GlobalParameters.subjects.addAll(List<String>.from(body['subject']));
    GlobalParameters.semesters = int.parse(body['semester']);
  }
}
