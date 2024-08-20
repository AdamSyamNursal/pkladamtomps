import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kp/controllers/login/login_controller.dart';

class UserLoginView extends StatelessWidget {
  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Login Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () {
            if (loginController.rawJsonResponse.value.isEmpty) {
              return Center(
                child: Text('No user data available. Please log in first.'),
              );
            } else {
              return SingleChildScrollView(
                child: Text(
                  loginController.rawJsonResponse.value,
                  style: TextStyle(fontSize: 16),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
