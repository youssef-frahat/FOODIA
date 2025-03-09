import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Base URL of your API
  static const String _baseUrl = "{{local}}/api";

  // Method to register a user
  static Future<Map<String, dynamic>> registerUser({
    required String username,
    required String phone,
    required String email,
    required String password,
  }) async {
    // Endpoint for registration
    const String endpoint = "$_baseUrl/register";

    // Prepare the request body
    final Map<String, dynamic> requestBody = {
      "username": username,
      "phone": phone,
      "email": email,
      "password": password,
    };

    try {
      // Send POST request to the API
      final response = await http.post(
        Uri.parse(endpoint),
        headers: {"Content-Type": "application/json"},
        body: json.encode(requestBody),
      );

      // Decode the response
      final responseData = json.decode(response.body);

      // Check the status code
      if (response.statusCode == 200) {
        // Success
        return {
          "success": true,
          "message": responseData["message"] ?? "Registration successful",
        };
      } else {
        // Error
        return {
          "success": false,
          "message": responseData["message"] ?? "Registration failed",
        };
      }
    } catch (e) {
      // Handle network errors
      return {
        "success": false,
        "message": "An error occurred. Please try again.",
      };
    }
  }
}
