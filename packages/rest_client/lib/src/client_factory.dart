import 'package:dio/dio.dart';

import 'mock_client.dart';
import 'rest_client.dart';
import 'retro_client.dart';

class ClientFactory {
  const ClientFactory();

  RestClient createClient() => RetroClient(Dio());

  RestClient createMockClient() => MockClient();
}
