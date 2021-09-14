import 'package:http/http.dart' as http;

Future<dynamic> getSummary() async {
  String url = 'https://api.covid19api.com/summary';
  try {
    final response = await http.get(url);
    return response.body;
  } catch (e) {
    print(e);
  }
}
