  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:get_storage/get_storage.dart';
  import 'package:kp/views/dashboard.dart';
  import 'package:kp/views/login_view.dart';
  import 'package:kp/views/offline_reconcille.dart';
  import 'package:kp/views/tambahcatatan.dart';

  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    try {
      await GetStorage.init(); // Initialize GetStorage
      print("GetStorage initialized successfully");
    } catch (e) {
      print("Error initializing GetStorage: $e");
    }

    runApp(MyApp());
  }

  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return GetMaterialApp(
        initialRoute: '/login',
        getPages: [
          GetPage(name: '/offlinereconcile', page: () => OfflineReconcille()),
          GetPage(name: '/login', page: () => LoginView()),
          GetPage(name: '/dashboard', page: () => Dashboard()),
          GetPage(name: '/tambahcatatan', page: () => Tambahcatatan()),
        ],
        // Optional: Enable debug banner for easy debugging
        debugShowCheckedModeBanner: false,
      );
    }
  }
