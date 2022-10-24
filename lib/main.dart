import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_firestore/view/screens/create_screen.dart';
import 'package:firebase_firestore/view/screens/delete_screen.dart';
import 'package:firebase_firestore/view/screens/home_screen.dart';
import 'package:firebase_firestore/view/screens/read_screen.dart';
import 'package:firebase_firestore/view/screens/update_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(360, 690),
      builder: (context, child) {
        return GetMaterialApp(
          theme: ThemeData(
              colorScheme:
                  ColorScheme.fromSwatch().copyWith(secondary: Colors.orange)),
          debugShowCheckedModeBanner: false,
          title: 'Welcome to Flutter',
          home: const HomeScreen(),
          getPages: [
            GetPage(
              name: "/homes_creen",
              page: () => const HomeScreen(),
            ),
            GetPage(
              name: "/create_screen",
              page: () => const CreateScreen(),
            ),
            GetPage(
              name: "/read_screen",
              page: () => const ReadScreen(),
            ),
            GetPage(
              name: "/update_screen",
              page: () => const UpdateScreen(),
            ),
            GetPage(
              name: "/delete_screen",
              page: () => const DeleteScreen(),
            )
          ],
        );
      },
    );
  }
}
