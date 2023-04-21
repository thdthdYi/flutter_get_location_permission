import 'package:flutter/material.dart';
import 'controller.dart';
import 'homescreen.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(Controller());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'sunflower',
      ),
      home: HomeScreen(),
    );
  }
}
