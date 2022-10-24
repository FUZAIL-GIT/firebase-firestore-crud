import 'package:flutter/material.dart';

class UpdateScreen extends StatefulWidget {
  static const String id = 'update_screen';

  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UPDATE"),
      ),
    );
  }
}
