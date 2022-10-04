import 'package:flutter/material.dart';

import '../api/ipinfo.dart';
import '../api/packageinfoapi.dart';
import '../widget/infodetail.dart';

class PackageInfoPage extends StatefulWidget {
  @override
  _PackageInfoPageState createState() => _PackageInfoPageState();
}

class _PackageInfoPageState extends State<PackageInfoPage> {
  Map<String, dynamic> packageInfo = {};

  @override
  void initState() {
    super.initState();

    init();
  }

  Future init() async {
    final packageInfo = await PackageInfoApi.getInfo();
    final ipAddress = await IpInfoApi.getIPAddress();

    final newPackageInfo = {
      'ipAddress': ipAddress,
      ...packageInfo,
    };

    if (!mounted) return;

    setState(() => this.packageInfo = newPackageInfo);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Package Info Page'),
          centerTitle: true,
        ),
        body: InfoWidget(map: packageInfo),
      );
}