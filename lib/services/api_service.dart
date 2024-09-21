// Inside ApiService
import 'dart:convert';

import '../models/ user.dart';

class ApiService {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/users';

  get http => null;

  // Get list of users
  Future<List<User>> getUsers() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        List<User> users = body.map((dynamic item) => User.fromJson(item)).toList();
        return users; // Return users if successful
      } else {
        throw Exception('Failed to load users');
      }
    } catch (error) {
      // Return empty list or handle error differently
      throw Exception('Error fetching users: $error');
    }
  }

  createUser(User newUser) {}

  deleteUser(int id) {}

  updateUser(User updatedUser) {}
}
