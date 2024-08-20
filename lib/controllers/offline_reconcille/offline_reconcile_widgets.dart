import 'package:flutter/material.dart';
import 'package:kp/controllers/offline_reconcille/widget/build_option_container.dart';

void showAddEvidenceDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Tambah Evidence'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10),
            buildOptionContainer(
              context,
              'Ambil Foto',
              Icons.camera_alt,
            ),
            SizedBox(height: 10),
            buildOptionContainer(
              context,
              'Ambil Foto dari Galeri',
              Icons.photo,
            ),
            SizedBox(height: 10),
            Container(
              width: 271,
              height: 37,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.cancel, color: Color(0xFFDE2475)),
                  SizedBox(width: 10),
                  Text(
                    "Batal",
                    style: TextStyle(
                      color: Color(0xFFDE2475),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
