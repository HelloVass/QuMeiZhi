import 'package:flutter/material.dart';
import 'package:flutter_meizhi/components/main/components/MainPageWidget.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPageWidget(),
    );
  }
}
