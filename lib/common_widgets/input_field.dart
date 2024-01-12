import 'package:flutter/material.dart';
import 'package:tourkuy/styles/style.dart';

class InputField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool obscureText;
  final String? Function(String?) validator;

  const InputField({
    Key? key,
    required this.labelText,
    required this.controller,
    this.obscureText = false,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          style: const TextStyle(
            fontSize: 12, // Set your desired font size
          ),
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(
                    255, 211, 211, 211), // Set your desired border color
              ),
            ),
            isDense: true,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppStyles.primaryColor),
            ),
          ),
        )
      ],
    );
  }
}
