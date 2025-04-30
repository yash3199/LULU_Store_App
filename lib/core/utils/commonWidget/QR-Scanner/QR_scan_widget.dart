import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'QR_scan_error_widget.dart';

class MobileScannerSimple extends StatefulWidget {
  const MobileScannerSimple({super.key});

  @override
  State<MobileScannerSimple> createState() => _MobileScannerSimpleState();
}

class _MobileScannerSimpleState extends State<MobileScannerSimple> {
  Barcode? barcode;



  void _handleBarcode(BarcodeCapture barcodes) {
    if (mounted) {
      setState(() {
        barcode = barcodes.barcodes.firstOrNull;
      });
      if (barcode!=null) {
        String scannedData = barcode?.rawValue ?? "";
        Navigator.pop(context, scannedData);
      }
    }
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
              onDetect: _handleBarcode,
              errorBuilder: (context, error, child) {
                return QrScannerErrorWidget(
                  error: error,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

