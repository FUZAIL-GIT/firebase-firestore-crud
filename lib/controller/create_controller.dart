import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_firestore/utils/globals.dart';
import 'package:firebase_firestore/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CreateController extends GetxController {
  final RxBool _isLoading = false.obs;
  final Rx<DateTime> _dateTime = DateTime.now().obs;
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  DateTime get datetime => _dateTime.value;
  bool get isLoading => _isLoading.value;
  final globalKey = GlobalKey<FormState>();

  void pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.orange, // header background color
              onPrimary: Colors.black, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      firstDate: DateTime(2015, 8),
      initialDate: _dateTime.value,
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _dateTime.value) {
      _dateTime.value = picked;

      talker.info(_dateTime.value);
    }
  }

  Future createUser() async {
    _isLoading.value = true;
    var data = {
      "name": name.text,
      "password": password.text,
      "postDate": DateFormat.yMMMMd().format(datetime)
    };
    //it is the doc reference
    final docRef = FirebaseFirestore.instance.collection('Users').doc();
    docRef.set(data).whenComplete(() {
      _isLoading.value = false;
      name.text = '';
      password.text = '';
      _dateTime.value = DateTime.now();
      talker.info("DateInserted Successfully");
      Get.off(
        const HomeScreen(),
      );
    });
  }
}
