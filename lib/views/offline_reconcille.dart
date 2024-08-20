import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kp/controllers/offline_reconcille/offline_reconcile_widgets.dart';
import 'package:kp/controllers/offline_reconcille/widget/build_record_container.dart';

class OfflineReconcille extends StatelessWidget {
  const OfflineReconcille({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 15.19,
                          width: 15.58,
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        child: Text(
                          'Offline Reconcile',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            height: 1.5,
                            letterSpacing: 0.25,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/tambahcatatan');
                        },
                        child: buildRecordContainer(
                          date: '10/10/2022 10:10:10',
                          note: 'Catatan: Catatan Evidence',
                        ),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/tambahcatatan');
                        },
                        child: buildRecordContainer(
                          date: '10/10/2022 10:10:10',
                          note: 'Catatan: Catatan Evidence',
                        ),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/tambahcatatan');
                        },
                        child: buildRecordContainer(
                          date: '10/10/2022 10:10:10',
                          note: 'Catatan: Catatan Evidence',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        width: 360,
        height: 53,
        child: Center(
          child: Container(
            width: 339,
            height: 37,
            child: TextButton(
              onPressed: () {
                showAddEvidenceDialog(context);
              },
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFFDE2475), // Button background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Tambah Offline Reconcile',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
