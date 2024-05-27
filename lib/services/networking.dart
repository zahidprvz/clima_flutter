import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future<Map<String, dynamic>?> getData() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Error fetching weather data: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Exception while fetching weather data: $e');
      return null;
    }
  }
}
