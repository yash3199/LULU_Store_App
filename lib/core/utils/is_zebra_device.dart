import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

class IsZebraDevice {
  static Future<bool> isZebraDevice() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      String manufacturer = androidInfo.manufacturer.toLowerCase();

      return manufacturer.contains("zebra"); // Returns true if Zebra device
    }
    return false;
  }
}
