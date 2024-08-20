// lib/controllers/dashboard/dashboard.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kp/controllers/dashboard/widget/logout_dialog.dart';
import 'package:kp/controllers/dashboard/widget/option_button.dart';
import 'package:kp/controllers/login/login_controller.dart';

class Dashboard extends StatelessWidget {
  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 111,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFDE2475), Color(0xFFFF4C34)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => Text(
                          'Hi, ${loginController.user.value.name}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        "Selamat datang di aplikasi ",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "BulkApp Tomps",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 170,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 20),
                    OptionButton(
                      icon: Icons.save,
                      title: "Reconcile",
                      subtitle: "Reconcile update & bulk upload",
                      onTap: () {
                        // Handle Reconcile button tap
                      },
                    ),
                    SizedBox(height: 20),
                    OptionButton(
                      icon: Icons.download_for_offline,
                      title: "Offline Reconcile",
                      subtitle: "Save Offline Reconcile",
                      onTap: () {
                        Get.toNamed('/offlinereconcile');
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: GestureDetector(
                  onTap: () {
                    showLogoutDialog(context);
                  },
                  child: Container(
                    height: 43,
                    width: 304,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF4C34),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Logout",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
