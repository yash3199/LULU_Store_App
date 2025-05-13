import 'dart:io';
import 'package:flutter_datawedge/flutter_datawedge.dart';
import 'package:flutter/material.dart';
import '../../../presentation/screens/articleEnquiry/article_enquiry_view_model.dart';
import '../is_zebra_device.dart';
import 'QR-Scanner/QR_scan_widget.dart';

class ScannerService {
  static final ScannerService _instance = ScannerService._internal();
  factory ScannerService() => _instance;

  late FlutterDataWedge _fdw;
  bool _initialized = false;

  ScannerService._internal();

  Future<void> initScanner(Function(String) onScanResultCallback) async {
    print("coming in scanner initialization process");
    if (_initialized || !Platform.isAndroid) return;

    _fdw = FlutterDataWedge();
    await _fdw.initialize();
    await _fdw.createDefaultProfile(profileName: 'lulu store app barcode scanner');

    _fdw.onScanResult.listen((ScanResult result) {
      if (result.data.isNotEmpty) {
        print("Scanned from Zebra: ${result.data}");
        onScanResultCallback(result.data); // call the callback when data scanned
      }
    });

    _initialized = true;
  }

  Future<void> openScanner(BuildContext context, Function(String) onScanResultCallback) async {
    bool isZebra = await IsZebraDevice.isZebraDevice();
    print("Is Zebra Device: $isZebra");
    if (!isZebra) {
      final scannedData = await Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => MobileScannerSimple()),
      );

      if (scannedData != null) {
        onScanResultCallback(scannedData);
      }
    } else {
      try {
        print("Enabling Zebra scanner...");
        await _fdw.scannerControl(true);
      } catch (e) {
        print("Error using Zebra scanner: $e");
      }
    }
  }
}
