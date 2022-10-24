import 'package:flutter/material.dart';

class ReadScreen extends StatefulWidget {
  static const String id = 'read_screen';

  const ReadScreen({super.key});

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("READ"),
      ),
    );
  }
}
