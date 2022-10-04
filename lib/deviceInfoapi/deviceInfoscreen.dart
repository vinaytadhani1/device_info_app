import 'dart:io';
import 'package:flutter/material.dart';

import 'page/buginfopage.dart';
import 'page/deviceinfopage.dart';
import 'page/packageinfopage.dart';


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: buildBottomBar(),
        body: buildPages(),
      );

  Widget buildBottomBar() {
    
    final style = const TextStyle(color: Colors.white);

    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black38,
      currentIndex: index,
      elevation: 5,
      items: [
         BottomNavigationBarItem(
          icon: Image.asset('Asset/bugs.png',
            height:40,width: 40,
            fit: BoxFit.cover,
          ),

          label: 'Bug Report',
          backgroundColor: Colors.black,
        ),
         BottomNavigationBarItem(
          icon: Image.asset('Asset/info.png',
            height:40,width: 40,
            fit: BoxFit.cover,
          ),
          label: 'DeviceInfo',
          backgroundColor: Colors.black,
        ),
         BottomNavigationBarItem(
          icon: Image.asset('Asset/settings.png',
            height:40,width: 40,
            fit: BoxFit.cover,
          ),
          label: 'PackageInfo',
          backgroundColor: Colors.black,
        ),
      ],
      onTap: (int index) => setState(() => this.index = index),
    );
  }

  Widget buildPages() {
    switch (index) {
      case 0:
        return BugInfoPage();
      case 1:
        return DeviceInfoPage();
      case 2:
        return PackageInfoPage();
      default:
        return Container();
    }
  }
}