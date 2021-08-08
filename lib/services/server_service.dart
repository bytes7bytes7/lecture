import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lecture/constants.dart';

import '../global_parameters.dart';
import '../models/lecture.dart';
import '../security/server_uri.dart';

abstract class ServerService {
  static Future<List<Lecture>> getLectures(Map<String, dynamic> data) async {
    var client = http.Client();
    http.Response uriResponse;
    try {
      uriResponse = await client.get(
        Uri.http(ServerURI.serverAuthority, ServerURI.getLectures, data),
        headers: {
          'accept': 'application/json',
        },
      );
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
      uriResponse = await client.get(Uri.http(ServerURI.serverAuthority,
          ServerURI.getFilterData, {'university': ConstantHTTP.university}));
    } finally {
      client.close();
    }
    var body = json.decode(utf8.decode(uriResponse.bodyBytes));
    GlobalParameters.faculties.clear();
    GlobalParameters.levels.clear();
    GlobalParameters.subjects.clear();
    GlobalParameters.semesters = 0;

    GlobalParameters.faculties.addAll(List<String>.from(body['faculties']));
    GlobalParameters.levels.addAll(List<String>.from(body['all_levels']));
    GlobalParameters.subjects.addAll(List<String>.from(body['all_subjects']));
    GlobalParameters.semesters = body['max_semester'];
  }

  static Future<void> uploadLecture(Lecture lecture) async {
    http.Response uriResponse;
    var data = lecture.toMap();
    http.Response image = await http
        .get(Uri.parse('https://pbs.twimg.com/media/EG10LtNX4AAHWyl.jpg'));
    var base64 = const Base64Encoder().convert(image.bodyBytes);
    data['content']['photos'].add(base64);
    var client = http.Client();
    try {
      uriResponse = await client.post(
        Uri.http(ServerURI.serverAuthority, ServerURI.addLecture),
        body: json.encode(data),
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
    } finally {
      client.close();
    }
    //print(json.decode(utf8.decode(uriResponse.bodyBytes)));
  }
}
