import 'package:dio/dio.dart';

import 'rest_client.dart';
import 'retro_client.dart';

class ClientFactory {
  RestClient createClient() => RetroClient(Dio());
}
