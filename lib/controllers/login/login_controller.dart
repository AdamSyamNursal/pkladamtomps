import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kp/services/api_service.dart';
import 'package:kp/models/user.dart';
import 'package:kp/controllers/login/widget/dropdown_controller.dart';
import 'package:kp/controllers/login/widget/password_visibility_controller.dart';
import 'package:kp/views/dashboard.dart';
import 'dart:convert';

class LoginController extends GetxController {
  final DropdownController dropdownController = Get.put(DropdownController());
  final PasswordVisibilityController passwordVisibilityController = Get.put(PasswordVisibilityController());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var user = User(id: '', email: '', name: '').obs;
  var loginError = ''.obs;
  var rawJsonResponse = ''.obs;

  void login() async {
    final baseUrl = {
      'Production': 'https://api-telkom.tomps.id',
      'Staging': 'https://stg-api-telkom.tomps.id',
      'Development': 'https://dev-api-telkom.tomps.id'
    }[dropdownController.selectedEnvironment.value]!;

    try {
      final response = await ApiService(baseUrl).login(emailController.text, passwordController.text);
      print('API Response: $response');

      // Store raw JSON response as a String
      rawJsonResponse.value = jsonEncode(response);

      // Process response to update user
      final name = response['data']['data_user']['NAME'];
      
      // Update user with the fetched name
      user.value = User(
        id: response['data']['data_user']['id'].toString(),
        email: response['data']['data_user']['EMAIL'],
        name: name,
      );

      print('User Name: ${user.value.name}'); // Debug print

      loginError.value = '';
      // Navigate to Dashboard after successful login
      Get.to(() => Dashboard());
    } catch (e) {
      loginError.value = 'Invalid username or password';
      print('Login failed: $e');
      // Show error message
      Get.snackbar(
        'Login Failed',
        'Invalid username or password',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void showEnvironmentSelectionDialog() {
    Get.defaultDialog(
      title: "Pilih Environment",
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: ['Development', 'Staging', 'Production'].map((String environment) {
          return ListTile(
            title: Text(environment),
            onTap: () {
              dropdownController.changeEnvironment(environment);
              Get.back();
            },
          );
        }).toList(),
      ),
    );
  }
}
