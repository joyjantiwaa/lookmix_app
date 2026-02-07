import 'package:flutter/material.dart';
import 'package:lookmix_design_system/lookmix_design_system.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyHeader(
        variant: HeaderVariant.website,
        logoName: 'LOOKMIX SCAN',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.qr_code_scanner, size: 100, color: Colors.blue),
            const SizedBox(height: 20),
            const Text("Ready to Scan", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 40),
            LookmixButton(
              onClick: () {
                // เปลี่ยนหน้าไปที่ /main
                Navigator.pushNamed(context, '/main');
              },
              children: const Text("Start Scanning"),
            ),
          ],
        ),
      ),
    );
  }
}