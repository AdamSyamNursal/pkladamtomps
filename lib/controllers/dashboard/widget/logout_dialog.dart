// lib/controllers/dashboard/widget/logout_dialog.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kp/views/login_view.dart';

void showLogoutDialog(BuildContext context) {
  Get.defaultDialog(
    title: "Logout",
    middleText: "Apa Anda yakin untuk melakukan logout?",
    textCancel: "Tidak",
    cancelTextColor: Color(0xFFDE2475),
    onCancel: () => Get.back(), // Close the dialog
    textConfirm: "Ya",
    confirmTextColor: Colors.white,
    buttonColor: Color(0xFFDE2475),
    onConfirm: () {
      // Clear user session data
      GetStorage().erase(); // Or use any other method to clear session

      // Navigate back to login screen
      Get.off(() => LoginView());
    },
  );
}
