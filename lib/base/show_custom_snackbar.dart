import 'package:e_commerce/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void showCustomSnackBar(String message,
    {bool isError = true, String title = "Error", Color color = Colors.redAccent}) {
  Get.snackbar(
    title,
    message,
    titleText: mBigText(text: title, color: Colors.white),
    messageText: Text(
      message,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    colorText: Colors.white,
    snackPosition: SnackPosition.TOP,
    backgroundColor: color
  );
}
