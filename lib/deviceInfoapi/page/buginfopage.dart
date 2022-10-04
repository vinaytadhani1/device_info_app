import 'dart:io';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../api/deviceinfoapi.dart';
import '../api/ipinfo.dart';
import '../api/packageinfoapi.dart';
import '../widget/infodetail.dart';

class BugInfoPage extends StatefulWidget {
  @override
  _BugInfoPageState createState() => _BugInfoPageState();
}

class _BugInfoPageState extends State<BugInfoPage> {
  Map<String, dynamic> map = {};

  @override
  void initState() {
    super.initState();

    init();
  }

  Future init() async {
    final packageName = await PackageInfoApi.getPackageName();
    final appVersion = await PackageInfoApi.getAppVersion();
    final ipAddress = await IpInfoApi.getIPAddress();
    final phone = await DeviceInfoApi.getPhoneInfo();
    final phoneVersion = await DeviceInfoApi.getPhoneVersion();
    final operatingSystem = await DeviceInfoApi.getOperatingSystem();
    final screenResolution = await DeviceInfoApi.getScreenResoluation();

    if (!mounted) return;

    setState(() => map = {
          'IP Address': ipAddress,
          'Phone': phone,
          'Phone OS Version': phoneVersion,
          'Operating System': operatingSystem,
          'Screen Resolution': screenResolution,
          '': '',
          'App Version': appVersion,
          Platform.isAndroid ? 'Package Name' : 'Bundle ID': packageName,
        });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Bug Info Page'),
          centerTitle: true,
        ),
        body: InfoWidget(map: map),
      );
}