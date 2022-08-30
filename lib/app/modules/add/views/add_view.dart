import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_controller.dart';

class AddView extends GetView<AddController> {
  const AddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddView'),
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
              controller: controller.password,
              decoration: const InputDecoration(
                hintText: "Password",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (controller.formKey.currentState!.validate()) {
                  controller.addData();
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
