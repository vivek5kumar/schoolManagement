import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:schoolmanagement/custom_widgets/colors.dart';

class FeePaymentPage extends StatefulWidget {
  FeePaymentPage({super.key});

  @override
  State<FeePaymentPage> createState() => _FeePaymentPageState();
}

class _FeePaymentPageState extends State<FeePaymentPage> {
  String qrCode = 'Unknown';

  Future<void> scanQRCode() async {
    String? barcodeScanRes;
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancle", true, ScanMode.QR);
      if (!mounted) return;
      setState(() {
        this.qrCode = barcodeScanRes.toString();
      });
    } on PlatformException {
      qrCode = "Failed to get plateform version";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlueColor,
      appBar: AppBar(
        title: const Text("Fee Payment"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            child: Column(
              children: [
                InkWell(
                    onTap: () => scanQRCode(),
                    child: const Icon(Icons.qr_code_scanner_rounded)),
                const Text('scan')
              ],
            ),
          )
        ],
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Scan Result",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white54,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 28,
            ),
            const Text(
              "QRCode",
              style: TextStyle(fontSize: 28, color: Colors.white),
            ),
            const SizedBox(
              height: 72,
            ),
            Text(
              "Scan code:${qrCode}",
              style: TextStyle(fontSize: 28, color: Colors.white),
            )
          ],
        ),
      )),
    );
  }
}
