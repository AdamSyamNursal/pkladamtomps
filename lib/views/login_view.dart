import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kp/controllers/login/widget/password_visibility_controller.dart';
import 'package:kp/controllers/login/widget/dropdown_controller.dart';
import 'package:kp/controllers/login/login_controller.dart';

class LoginView extends StatelessWidget {
  final loginController = Get.put(LoginController());
  final dropdownController = Get.put(DropdownController());
  final passwordVisibilityController = Get.put(PasswordVisibilityController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset("assets/images/tomb.jpg", height: 150, width: 250, fit: BoxFit.fill),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Development"),
                  SizedBox(height: 10),
                  _buildDropdown(),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Username"),
                  _buildTextField(loginController.emailController, "Username"),
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Password"),
                  _buildPasswordTextField(),
                ],
              ),
            ),
            Obx(() {
              if (loginController.loginError.value.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    loginController.loginError.value,
                    style: TextStyle(color: Colors.red),
                  ),
                );
              } else {
                return Container();
              }
            }),
            Container(
              child: Column(
                children: [
                  _buildLoginButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    return Obx(
      () => GestureDetector(
        onTap: () => loginController.showEnvironmentSelectionDialog(),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  dropdownController.selectedEnvironment.value,
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ),
              const Icon(Icons.keyboard_arrow_down_rounded, color: Color(0xFFAFBDD8)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: TextField(
          controller: loginController.passwordController,
          obscureText: !passwordVisibilityController.isPasswordVisible.value,
          decoration: InputDecoration(
            labelText: "Password",
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: Icon(
                passwordVisibilityController.isPasswordVisible.value
                    ? Icons.visibility
                    : Icons.visibility_off,
              ),
              onPressed: passwordVisibilityController.togglePasswordVisibility,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: loginController.login,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFDE2475),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.all(16),
        ),
        child: const Text(
          'Login',
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
