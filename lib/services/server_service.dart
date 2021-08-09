import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lecture/constants.dart';

import '../global_parameters.dart';
import '../models/lecture.dart';
import '../security/server_uri.dart';

abstract class ServerService {
  static Future<List<Lecture>> getLectures(Map<String, dynamic> data) async {
    http.Response? uriResponse;
    bool error = false;
    for (int _ = 0; _ < 3; _++) {
      var client = http.Client();
      try {
        uriResponse = await client.get(
          Uri.http(ServerURI.serverAuthority, ServerURI.getLectures, data),
          headers: {
            'accept': 'application/json',
          },
        );
        error = false;
      } catch (e) {
        error = true;
        // ignore: avoid_print
        print('getLecture error: $e');
      } finally {
        client.close();
      }
      if (!error) {
        break;
      }
    }
    List<Lecture> lectures = [];
    if (uriResponse != null) {
      var body = json.decode(utf8.decode(uriResponse.bodyBytes));
      for (Map<String, dynamic> m in body) {
        lectures.add(Lecture.fromMap(m));
      }
    }
    return lectures;
  }

  static Future<void> getFilterData() async {
    http.Response? uriResponse;
    bool error = false;
    for (int _ = 0; _ < 3; _++) {
      var client = http.Client();
      try {
        uriResponse = await client.get(Uri.http(ServerURI.serverAuthority,
            ServerURI.getFilterData, {'university': ConstantHTTP.university}));
        error = false;
      } catch (e) {
        error = true;
        // ignore: avoid_print
        print('getFilterData error $e');
      } finally {
        client.close();
      }
      if (!error) {
        break;
      }
    }
    if (uriResponse != null) {
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
  }

  static Future<void> uploadLecture(Lecture lecture) async {
    var data = lecture.toMap();
    http.Response? uriResponse;
    bool error = false;
    for (int _ = 0; _ < 3; _++) {
      // http.Response image = await http
      //     .get(Uri.parse('https://pbs.twimg.com/media/EG10LtNX4AAHWyl.jpg'));
      // var base64 = const Base64Encoder().convert(image.bodyBytes);
      // data['content']['photos'].add(base64);
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
        error = false;
      } catch (e) {
        error = true;
        // ignore: avoid_print
        print('uploadLecture error: $e');
      } finally {
        client.close();
      }
      if (!error) {
        break;
      }
    }
    if (uriResponse != null) {
      // ignore: avoid_print
      print(json.decode(utf8.decode(uriResponse.bodyBytes)));
    }
  }
}
