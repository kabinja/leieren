import 'dart:convert';
import 'package:http/http.dart' as http;

class JsonService {
  final http.Client client;

  JsonService(this.client);

  Future<dynamic> fetchJson(String url) async {
    final uri = Uri.parse(url);
    http.Response response = await this.client.get(uri);
    return jsonDecode(response.body);
  }
}
