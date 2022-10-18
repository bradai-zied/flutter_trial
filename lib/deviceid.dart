import 'package:flutter/services.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:home_widget/home_widget.dart';

    



  // Added by zvo
    // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String deviceId;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      deviceId = (await PlatformDeviceId.getDeviceId)!;
    } on PlatformException {
      deviceId = 'Failed to get deviceId.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    // if (!mounted) return;

      // await HomeWidget.saveWidgetData<String>('_deviceId', _deviceId);
      print("########## Full deviceId->$deviceId");
      await HomeWidget.saveWidgetData<String>('_deviceId', deviceId.substring(0,4));
      // return deviceId; 
    // });
  }
