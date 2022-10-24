import 'package:firebase_firestore/controller/create_controller.dart';
import 'package:firebase_firestore/utils/globals.dart';
import 'package:firebase_firestore/view/custom_widget.dart/custom_button.dart';
import 'package:firebase_firestore/view/custom_widget.dart/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CreateScreen extends StatelessWidget {
  static const String id = 'create_screen';
  const CreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CreateController createController = Get.put(CreateController());
    return Form(
      key: createController.globalKey,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.orange,
          title: Text(
            "CREATE",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
            ),
          ),
          centerTitle: true,
        ),
        body: Obx(
          () => Visibility(
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            visible: !createController.isLoading,
            child: Padding(
              padding: defaultPadding,
              child: Column(
                children: [
                  CustomTextField(
                    controller: createController.name,
                    label: "User Name",
                  ),
                  CustomTextField(
                    controller: createController.password,
                    label: "Password",
                  ),
                  selectDate(createController, context),
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: const Size.fromHeight(50), // NEW
                    ),
                    onPressed: () {
                      if (createController.globalKey.currentState!.validate()) {
                        createController.createUser();
                      }
                    },
                    child: const Text("SUBMIT"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget submitButton(CreateController createController) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        minimumSize: const Size.fromHeight(50), // NEW
      ),
      onPressed: () {
        if (createController.globalKey.currentState!.validate()) {
          createController.createUser();
        }
      },
      child: const Text("SUBMIT"),
    );
  }

  Widget selectDate(CreateController createController, BuildContext context) {
    return TextButton(
      onPressed: () {
        createController.pickDate(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Select Date",
            style: TextStyle(color: Colors.black),
          ),
          Obx(
            () => Text(
              DateFormat.yMMMMd().format(createController.datetime).toString(),
              style: const TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
