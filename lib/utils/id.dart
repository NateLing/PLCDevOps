import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

Future<String> getDeviceId() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return androidInfo.id;
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;

    final identifierForVendor = iosInfo.identifierForVendor;
    if (identifierForVendor == null) {
      throw Exception("");
    }
    return identifierForVendor;
  } else if (Platform.isWindows) {
    WindowsDeviceInfo windowsInfo = await deviceInfo.windowsInfo;
    return windowsInfo.deviceId;
  } else if (Platform.isMacOS) {
    MacOsDeviceInfo macInfo = await deviceInfo.macOsInfo;
    final systemGUID = macInfo.systemGUID;
    if (systemGUID == null) {
      throw Exception("");
    }
    return systemGUID;
  } else {
    throw Exception("");
  }
}
