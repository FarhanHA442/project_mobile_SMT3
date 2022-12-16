import 'dart:convert';

import 'package:project/model/BeritaData.dart';
import 'package:http/http.dart';

class apiBerita {
  Client http = Client();
  String url = 'http://10.10.3.39';
  Future<BeritaData> getBeritaData() async {
    String api_url = '$url/pedansial/src/api/controllers/BeritaController.php';
    print(api_url);
    Response response = await http.get(Uri.parse(api_url));

    if (response.statusCode == 200) {
      return BeritaData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error Code: ${response.statusCode}');
    }
  }
}
