import 'package:flutter/material.dart';

class DeleteScreen extends StatefulWidget {
  static const String id = 'delete_screen';

  const DeleteScreen({super.key});

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DELETE"),
      ),
    );
  }
}
