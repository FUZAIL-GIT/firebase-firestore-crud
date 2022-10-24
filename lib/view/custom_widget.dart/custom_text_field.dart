import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.label,
      this.validator});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: widget.validator ??
            (value) {
              if (value == '' || value!.isEmpty) {
                return 'Please Enter ${widget.label}';
              }
              return null;
            },
        decoration: InputDecoration(
          label: Text(widget.label),
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 3,
              color: Colors.orange,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        controller: widget.controller,
      ),
    );
  }
}
