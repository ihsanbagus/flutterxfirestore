import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditController extends GetxController {
  final db = FirebaseFirestore.instance;
  final formKey = GlobalKey<FormState>();
  final username = TextEditingController();
  final password = TextEditingController();

  void initValue() {
    username.text = Get.arguments.data()['username'] ?? "";
    password.text = Get.arguments.data()['password'] ?? "";
  }

  void editData(var id) async {
    await db.collection("users").doc(id).update({
      "username": username.text,
      "password": password.text,
    });
    username.clear();
    password.clear();
    Get.back();
    Get.snackbar("SUCCESS", "DATA EDITED!");
  }

  @override
  void onClose() {
    super.onClose();
    username.dispose();
    password.dispose();
  }
}
