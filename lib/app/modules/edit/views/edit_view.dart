import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_controller.dart';

class EditView extends GetView<EditController> {
  const EditView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.initValue();
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditView'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Username cannot be empty";
                }
                return null;
              },
              // initialValue: Get.arguments.data()['username'] ?? "",
              controller: controller.username,
              decoration: const InputDecoration(
                hintText: "Username",
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Password cannot be empty";
                }
                return null;
              },
              // initialValue: Get.arguments.data()['password'] ?? "",
              controller: controller.password,
              decoration: const InputDecoration(
                hintText: "Password",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (controller.formKey.currentState!.validate()) {
                  controller.editData(Get.arguments.id);
                }
              },
              child: const Text("ADD"),
            ),
          ],
        ),
      ),
    );
  }
}
