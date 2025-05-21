import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';



class MobileScannerSimple extends StatefulWidget {
  const MobileScannerSimple({super.key});

  @override
  State<MobileScannerSimple> createState() => _MobileScannerSimpleState();
}

class _MobileScannerSimpleState extends State<MobileScannerSimple> {
  final MobileScannerController _controller = MobileScannerController();
  Barcode? barcode;
  bool _isProcessing = false;

  void _handleBarcode(BarcodeCapture barcodes) async {
    if (_isProcessing) return;
    _isProcessing = true;

    barcode = barcodes.barcodes.firstOrNull;
    if (barcode != null && mounted) {
      String scannedData = barcode?.rawValue ?? "";

      // Stop the scanner
      await _controller.stop();

      // Optional: add slight delay to ensure texture cleanup
      await Future.delayed(const Duration(milliseconds: 150));

      if (mounted) {
        Navigator.pop(context, scannedData);
      }
    } else {
      _isProcessing = false; // Reset if invalid scan
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            height: 0.6.sh,
            width: 0.9.sw,
            color: Colors.transparent,
            child: MobileScanner(
              controller: _controller,
              onDetect: _handleBarcode,
              errorBuilder: (context, error, child) {
                return Center(child: Text("Error: $error"));
              },
            ),
          ),
        ),
      ],
    );
  }
}


