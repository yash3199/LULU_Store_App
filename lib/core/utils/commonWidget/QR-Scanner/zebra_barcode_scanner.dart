import 'package:flutter/material.dart';
import 'package:flutter_datawedge/flutter_datawedge.dart';
import 'dart:async';


class ZebraBarcodeScanner extends StatefulWidget {
  const ZebraBarcodeScanner({super.key});

  @override
  _ZebraBarcodeScannerState createState() => _ZebraBarcodeScannerState();
}

class _ZebraBarcodeScannerState extends State<ZebraBarcodeScanner> {
  final FlutterDataWedge _dataWedge = FlutterDataWedge();
  StreamSubscription? _onScanSubscription;

  @override
  void initState() {
    super.initState();
    _initializeDataWedge();
  }

  /// Initialize DataWedge and create a scanning profile
  Future<void> _initializeDataWedge() async {
    await _dataWedge.initialize();

    // Create a default DataWedge profile
    await _dataWedge.createDefaultProfile(profileName: "FlutterBarcodeScanner");

    // Listen to scan events
    _onScanSubscription = _dataWedge.onScanResult.listen((ScanResult result) {
      print("Scanned Data: ${result.data}");
      // Handle scanned data here
    });
  }

  // @override
  // void dispose() {
  //   _onScanSubscription?.cancel();
  //   //_dataWedge.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Zebra Barcode Scanner')),
        body: Center(
          child: Text("Scan a barcode using Zebra device"),
        ),
      ),
    );
  }
}

