import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class GenericRepository {
  String url = "rickandmortyapi.com";

  Future<Response> getInfo(String path, String page) async {
    var uriUrl = Uri.https(url, "/api/$path", {"page": page});
    return await http.get(uriUrl);
  }
}
