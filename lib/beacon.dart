import 'package:beacon_broadcast/beacon_broadcast.dart';

BeaconBroadcast beaconBroadcast = BeaconBroadcast();

Future<void> broadcastme(String devid) async {
  
  beaconBroadcast.getAdvertisingStateChange().listen((isAdvertising) {
    // Now you know if beacon is advertising
    print('---- beacon is braodcasting');
    return;
  });
  beaconBroadcast
    .setUUID('39ED98FF-'+devid+'-441A-802F-9C398FCABCDE')
    .setMajorId(1)
    .setMinorId(100)
    .setTransmissionPower(-59) //optional
    .setAdvertiseMode(AdvertiseMode.lowPower) //Android-only, optional
    // .setIdentifier('com.example.myDeviceRegion') //iOS-only, optional
    // .setLayout('s:0-1=feaa,m:2-2=10,p:3-3:-41,i:4-21v') //Android-only, optional
    .setManufacturerId(0xFEAA) //Android-only, optional
    .start();
    print('---- Broadcast Beacon');
    await Future.delayed(const Duration(milliseconds: 5000));
    beaconBroadcast.stop();
    print('---- END  Broadcast Beacon');

}