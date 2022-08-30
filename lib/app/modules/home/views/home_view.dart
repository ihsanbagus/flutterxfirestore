import 'package:flutter/material.dart';
import 'package:flutterxfirestore/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.getData();
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            ...controller.data.map((doc) {
              return ListTile(
                onTap: () => Get.toNamed(
                  Routes.EDIT,
                  arguments: doc,
                ),
                title: Text("${doc.data()['username']}"),
                subtitle: Text("${doc.data()['password']}"),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    controller.deleteData(doc.id);
                  },
                ),
              );
            }).toList(),
            const SizedBox(height: 100)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
