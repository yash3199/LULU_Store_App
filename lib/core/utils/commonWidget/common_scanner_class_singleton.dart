import 'dart:async';
import 'dart:io';
import 'package:flutter_datawedge/flutter_datawedge.dart';
import 'package:flutter/material.dart';
import '../../../presentation/screens/articleEnquiry/article_enquiry_view_model.dart';
import '../is_zebra_device.dart';
import 'QR-Scanner/QR_scan_widget.dart';

// class ScannerService {
//   static final ScannerService _instance = ScannerService._internal();
//   factory ScannerService() => _instance;
//
//   late FlutterDataWedge _fdw;
//   bool _initialized = false;
//
//   ScannerService._internal();
//
//   Future<void> initScanner(Function(String) onScanResultCallback) async {
//     print("coming in scanner initialization process");
//     if (_initialized || !Platform.isAndroid) return;
//
//     _fdw = FlutterDataWedge();
//     await _fdw.initialize();
//     await _fdw.createDefaultProfile(profileName: 'lulu store app barcode scanner');
//
//     _fdw.onScanResult.listen((ScanResult result) {
//       if (result.data.isNotEmpty) {
//         print("Scanned from Zebra: ${result.data}");
//         onScanResultCallback(result.data); // call the callback when data scanned
//       }
//     });
//
//     _initialized = true;
//   }
//
//   Future<void> openScanner(BuildContext context, Function(String) onScanResultCallback) async {
//     bool isZebra = await IsZebraDevice.isZebraDevice();
//     print("Is Zebra Device: $isZebra");
//     if (!isZebra) {
//       final scannedData = await Navigator.push(
//         context,
//         MaterialPageRoute(builder: (_) => MobileScannerSimple()),
//       );
//
//       if (scannedData != null) {
//         print("scanned data in mobile phone is ${scannedData}");
//         onScanResultCallback(scannedData);
//       }
//     } else {
//       try {
//         print("Enabling Zebra scanner...");
//         await _fdw.scannerControl(true);
//       } catch (e) {
//         print("Error using Zebra scanner: $e");
//       }
//     }
//   }
// }


class ScannerService {
  static final ScannerService _instance = ScannerService._internal();
  factory ScannerService() => _instance;

  late FlutterDataWedge _fdw;
  bool _initialized = false;

  final StreamController<String> _scanStreamController = StreamController.broadcast();

  ScannerService._internal();

  Future<void> initScanner() async {
    if (_initialized || !Platform.isAndroid) return;

    _fdw = FlutterDataWedge();
    await _fdw.initialize();
    await _fdw.createDefaultProfile(profileName: 'lulu store app barcode scanner');

    _fdw.onScanResult.listen((ScanResult result) {
      if (result.data.isNotEmpty) {
        print("Scanned from Zebra: ${result.data}");
        _scanStreamController.add(result.data); // emit data to stream
      }
    });

    _initialized = true;
  }

  /// This will return a Future that resolves when scanning is done
  Future<String> scan(BuildContext context) async {
    await initScanner();
    final completer = Completer<String>();
    final isZebra = await IsZebraDevice.isZebraDevice();

    late final StreamSubscription sub;
    sub = _scanStreamController.stream.listen((data) {
      if (!completer.isCompleted) {
        completer.complete(data);
        sub.cancel();
      }
    });

    if (!isZebra) {
      final scannedData = await Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => MobileScannerSimple()),
      );
      if (scannedData != null) {
        completer.complete(scannedData);
      }
    } else {
      try {
        await _fdw.scannerControl(true); // enable Zebra scanner
      } catch (e) {
        completer.completeError("Zebra scanner error: $e");
      }
    }

    return completer.future;
  }
}
