import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constants/api.dart' as const_api;
import '../global_parameters.dart';
import '../models/lecture.dart';
import '../security/server_uri.dart';

abstract class ServerService {
  static Future<List<Lecture>> getLectures(Map<String, dynamic> data) async {
    http.Response? uriResponse;
    var error = false;
    for (var i = 0; i < 3; i++) {
      final client = http.Client();
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
    final lectures = <Lecture>[];
    if (uriResponse != null) {
      final body = json.decode(utf8.decode(uriResponse.bodyBytes));
      for (Map<String, dynamic> m in body) {
        lectures.add(Lecture.fromMap(m));
      }
    }
    return lectures;
  }

  static Future<void> getFilterData() async {
    http.Response? uriResponse;
    var error = false;
    for (var i = 0; i < 3; i++) {
      final client = http.Client();
      try {
        uriResponse = await client.get(
          Uri.http(
            ServerURI.serverAuthority,
            ServerURI.getLectures,
            {'university': const_api.university},
          ),
        );
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
      final body = json.decode(utf8.decode(uriResponse.bodyBytes));
      GlobalParameters.faculties.clear();
      GlobalParameters.levels.clear();
      GlobalParameters.subjects.clear();
      GlobalParameters.semesters = 0;

      if (body is Map<String, Object?>) {
        final faculties = body[const_api.allFaculties];
        final levels = body[const_api.allLevels];
        final subjects = body[const_api.alSubjects];
        final maxSemester = body[const_api.maxSemester];

        if (faculties is List<String>) {
          GlobalParameters.faculties.addAll(faculties);
        }

        if (levels is List<String>) {
          GlobalParameters.levels.addAll(levels);
        }

        if (subjects is List<String>) {
          GlobalParameters.subjects.addAll(subjects);
        }

        if (maxSemester is int) {
          GlobalParameters.semesters = maxSemester;
        }
      }
    }
  }

  static Future<void> uploadLecture(Lecture lecture) async {
    final data = lecture.toMap();
    http.Response? uriResponse;
    var error = false;
    for (var i = 0; i < 3; i++) {
      // http.Response image = await http
      //     .get(Uri.parse('https://pbs.twimg.com/media/EG10LtNX4AAHWyl.jpg'));
      // var base64 = const Base64Encoder().convert(image.bodyBytes);
      // data['content']['photos'].add(base64);
      final client = http.Client();
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
