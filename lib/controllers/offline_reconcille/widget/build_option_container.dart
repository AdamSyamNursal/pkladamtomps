import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kp/controllers/offline_reconcille/widget/pick_image.dart';
import 'package:kp/controllers/offline_reconcille/widget/upload_evidence_service.dart';
 // Update with your actual import path

Widget buildOptionContainer(BuildContext context, String text, IconData icon) {
  return GestureDetector(
    onTap: () async {
      final pickedFile = await pickImage(
        text == 'Ambil Foto' ? ImageSource.camera : ImageSource.gallery,
      );
      
      if (pickedFile != null) {
        final file = File(pickedFile.path);
        await uploadEvidence(evidenceFile: file, context: context);
      }
    },
    child: Container(
      width: 271,
      height: 37,
      decoration: BoxDecoration(
        color: Color(0xFFDE2475),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
