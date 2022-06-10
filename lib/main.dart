import 'package:flutter/material.dart';
import 'package:scanner/Qr_Code_Screen/qr_code_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
return 
    MaterialApp(
      home: Qr_Code_Screen(),
    );
    
  }
}
