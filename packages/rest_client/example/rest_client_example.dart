import 'package:dio/dio.dart';
import 'package:quick_quotes_quill/console_quill.dart';
import 'package:quick_quotes_quill/spread_quill_manager.dart';
import 'package:rest_client/rest_client.dart';

void main() {
  SpreadQuillManager.inst.initialize(
    [
      ConsoleQuill('Example'),
    ],
  );

  final dio = Dio();
  dio.options.headers['accept'] = 'application/json';
  final client = ClientFactory().createClient();

  client.getLectures(null, {}).then((items) {
    for (final item in items) {
      SpreadQuillManager.inst.log(item);
    }
  });
}
