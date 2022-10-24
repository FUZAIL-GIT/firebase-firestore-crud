import 'package:firebase_firestore/utils/globals.dart';
import 'package:firebase_firestore/view/custom_widget.dart/custom_button.dart';
import 'package:firebase_firestore/view/screens/create_screen.dart';
import 'package:firebase_firestore/view/screens/delete_screen.dart';
import 'package:firebase_firestore/view/screens/read_screen.dart';
import 'package:firebase_firestore/view/screens/update_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 50,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w, top: 10.h, bottom: 10.h),
          child: const Image(
            image: AssetImage(
              "assets/firebase_logo.png",
            ),
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text("Firebase CRUD Operation"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              icon: Icons.send,
              label: "CREATE",
              onPressed: () {
                talker.info("CREATE");
                Get.to(
                  const CreateScreen(),
                  duration: const Duration(seconds: 1),
                  transition: Transition.downToUp,
                );
              },
            ),
            CustomButton(
              icon: Icons.get_app,
              label: "READ",
              onPressed: () {
                talker.info("READ");
                Get.to(
                  const ReadScreen(),
                  duration: const Duration(seconds: 2),
                  transition: Transition.downToUp,
                );
              },
            ),
            CustomButton(
              icon: Icons.update,
              label: "UPDATE",
              onPressed: () {
                talker.info("UPDATE");
                Get.to(
                  const UpdateScreen(),
                  duration: const Duration(seconds: 2),
                  transition: Transition.downToUp,
                );
              },
            ),
            CustomButton(
              icon: Icons.delete,
              label: "DELETE",
              onPressed: () {
                talker.info("DELETE");
                Get.to(
                  const DeleteScreen(),
                  duration: const Duration(seconds: 2),
                  transition: Transition.downToUp,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
