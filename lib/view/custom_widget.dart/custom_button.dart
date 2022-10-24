import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  const CustomButton(
      {super.key,
      required this.icon,
      required this.label,
      required this.onPressed});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    int n = widget.label.length - 1;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.yellow.shade800),
        ),
        icon: Icon(
          widget.icon,
          color: Colors.yellowAccent,
        ),
        onPressed: widget.onPressed,
        label: Row(
          children: [
            Text(
              widget.label.substring(0, 1),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
              ),
            ),
            Text(
              widget.label.substring(
                widget.label.length - n,
              ),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 15.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
