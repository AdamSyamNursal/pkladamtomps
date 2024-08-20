import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as path;
import 'dart:io';
import 'package:flutter/material.dart';

Future<void> uploadEvidence({
  required File evidenceFile,
  required BuildContext context,
}) async {
  final url = 'https://stg-api-mobtelkom.tomps.id/reconcile/uploadevidence/2957';

  var request = http.MultipartRequest('POST', Uri.parse(url));

  request.fields['iconId'] = '1';
  request.fields['notes'] = 'tes upload bulk';
  request.fields['latitude'] = '-6.21918261424291';
  request.fields['longitude'] = '106.81640763735832';
  request.fields['akurasi'] = '10';
  request.fields['group_evidence'] = 'test';
  request.fields['is_foto_utama'] = '0';
  request.fields['sys_driver_info'] = 'oss';

  request.files.add(
    http.MultipartFile(
      'evidence',
      evidenceFile.readAsBytes().asStream(),
      evidenceFile.lengthSync(),
      filename: path.basename(evidenceFile.path),
      contentType: MediaType('image', 'jpeg'),
    ),
  );

  try {
    final response = await request.send();
    if (response.statusCode == 201) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Success'),
          content: Text('Image uploaded successfully.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      throw Exception('Failed to upload image');
    }
  } catch (e) {
    print('Error uploading image: $e');
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text('Failed to upload image.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
