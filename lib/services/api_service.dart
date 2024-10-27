import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = 'https://reqres.in/api';

  Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse("$_baseUrl/login"),
      body: {"email": email, "password": password},
    );
    return response.statusCode == 200;
  }

  Future<bool> register(String email, String password) async {
    final response = await http.post(
      Uri.parse("$_baseUrl/register"),
      body: {"email": email, "password": password},
    );
    return response.statusCode == 200;
  }
}
