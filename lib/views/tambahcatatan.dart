import 'package:flutter/material.dart';

class Tambahcatatan extends StatelessWidget {
  const Tambahcatatan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                   onTap: () {
                   Navigator.pop(context);
                  },
                  child: Container(
                  alignment: Alignment.centerLeft,
                  child: Icon(Icons.arrow_back),
                ),
                ),
                SizedBox(height: 16.0), 
                Container(
                  child: Text(
                    "Tambah Catatan",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 32.0), 
                Container(
                  child: Center(
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32.0), 
                Container(
                  width: 327,
                  height: 156,
                  padding: EdgeInsets.all(16.0), 
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Catatan",
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: OutlineInputBorder(), 
                      contentPadding: EdgeInsets.all(12.0), 
                    ),
                    maxLines: null, 
                    expands: true, 
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
                //(context);
              },
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFFDE2475), // Button background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Simpan',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
