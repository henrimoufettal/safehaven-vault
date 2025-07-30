import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ScanDocumentScreen extends StatefulWidget {
  @override
  _ScanDocumentScreenState createState() => _ScanDocumentScreenState();
}

class _ScanDocumentScreenState extends State<ScanDocumentScreen> {
  File? _scannedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _scannedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan Document'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _scannedImage != null
                  ? Image.file(_scannedImage!)
                  : Icon(Icons.camera_alt, size: 80, color: Colors.grey),
              SizedBox(height: 20),
              Text(
                _scannedImage != null
                    ? 'Document scanned successfully.'
                    : 'Tap below to scan a document using your camera.',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Scan Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
