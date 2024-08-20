import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/user/login'),
      body: {
        'EMAIL': email,
        'PSWD': password,
        'player_id': ''
      },
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body) as Map<String, dynamic>;
      print('Login Response: $responseBody');
      return responseBody;
    } else {
      throw Exception('Failed to login');
    }
  }
}
