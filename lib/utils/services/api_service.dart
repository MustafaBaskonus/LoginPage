import 'dart:convert';
import 'package:LogIn/utils/constants/api_constants.dart';
import 'package:LogIn/utils/models/user_model.dart';
import 'package:http/http.dart' as http;

class APIService {
  // Kullanıcıları Getir
  Future<List<UserModel>> getUsers() async {
    final response = await http.get(Uri.parse(url));
    List<UserModel> users = [];
    List<dynamic> responseList = jsonDecode(response.body);

    for (var i = 0; i < responseList.length; i++) {
      users.add(UserModel.fromJson(responseList[i]));
    }
    return users;
  }

  // Kullanıcı girişini yapan metod
  Future<UserModel?> login(String email, String password) async {
    const String loginUrl = 'https://yourapi.com/api/';
    try {
      final response = await http.post(
        Uri.parse(loginUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'name': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return UserModel.fromJson(data);
      } else {
        return null; // Giriş başarısızsa null döner
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

/*
  // Kullanıcı Girişi
  Future<UserModel?> login(String email, String password) async {
    const String loginUrl = 'https://yourapi.com/api/login'; // API URL
    try {
      final response = await http.post(
        Uri.parse(loginUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // Eğer giriş başarılıysa
        final data = jsonDecode(response.body);
        return UserModel.fromJson(data); // Gelen kullanıcı verisini modelle
      } else {
        throw Exception('Login failed');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
  */
// Kullanıcı Kaydı
  Future<UserModel?> register(
      String name, String username, String email, String password) async {
    const String registerUrl = 'https://yourapi.com/api/register'; // API URL
    try {
      final response = await http.post(
        Uri.parse(registerUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'username': username,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 201) {
        // Eğer kayıt başarılıysa
        final data = jsonDecode(response.body);
        return UserModel.fromJson(data); // Yeni kullanıcıyı modelle
      } else {
        throw Exception('Registration failed');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
