import 'package:flutter/material.dart';
import 'screens/scan_screen.dart';

void main() {
  runApp(SafeHavenVaultApp());
}

class SafeHavenVaultApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeHaven Vault',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: ScanDocumentScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
