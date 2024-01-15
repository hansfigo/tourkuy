import 'package:flutter/material.dart';
import 'package:tourkuy/styles/style.dart';

class MyOutlineButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const MyOutlineButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: Size(double.infinity, 30),
        padding: EdgeInsets.symmetric(vertical: 18),
        side: BorderSide(
            width: 0.8,
            color: AppStyles.primaryColor), // Change to your desired color
        foregroundColor: AppStyles.primaryColor, // Change to your desired color
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
