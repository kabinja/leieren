import 'package:http/http.dart' as http;

class JsonService {
  Future<String> fetchJson(String authority, String path) async {
    var url = Uri.https(authority, path);
    http.Response response = await http.get(url);
    return response.body;
  }
}
