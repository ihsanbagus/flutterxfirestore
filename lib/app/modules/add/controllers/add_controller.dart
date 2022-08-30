import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddController extends GetxController {
  final db = FirebaseFirestore.instance;
  final formKey = GlobalKey<FormState>();
  final username = TextEditingController();
  final password = TextEditingController();

  void addData() async {
    await db.collection("users").add({
      "username": username.text,
      "password": password.text,
    });
    username.clear();
    password.clear();
    Get.back();
    Get.snackbar("SUCCESS", "DATA ADDED!");
  }

  @override
  void onClose() {
    super.onClose();
    username.dispose();
    password.dispose();
  }
}
