import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static void showSnackBar(String message) {
    Get.showSnackbar(
      GetSnackBar(
        message: message,
        backgroundColor: Colors.black,
        animationDuration: const Duration(seconds: 1),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
