import 'package:flutter/material.dart';

import '../api/deviceinfoapi.dart';
import '../widget/infodetail.dart';

class DeviceInfoPage extends StatefulWidget {
  @override
  _DeviceInfoPageState createState() => _DeviceInfoPageState();
}

class _DeviceInfoPageState extends State<DeviceInfoPage> {
  Map<String, dynamic> deviceInfo = {};

  @override
  void initState() {
    super.initState();

    init();
  }

  Future init() async {
    final deviceInfo = await DeviceInfoApi.getInfo();

    if (!mounted) return;
    setState(() => this.deviceInfo = deviceInfo);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Device Info Page'),
          centerTitle: true,
        ),
        body: InfoWidget(map: deviceInfo),
      );
}