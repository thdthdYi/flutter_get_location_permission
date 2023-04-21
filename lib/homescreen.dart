import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (Controller.to.isLoading.value == false) {
        return Center(child: CircularProgressIndicator());
      } else {
        print("start homescreen");

        return Container(
          child: CustomScrollView(slivers: [
            SliverToBoxAdapter(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      child: Text('homescreen'),
                    )
                  ]),
            )
          ]),
        );
      }
    }));
  }
}
