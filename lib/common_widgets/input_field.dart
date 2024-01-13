import 'package:flutter/material.dart';
import 'package:tourkuy/styles/style.dart';

class InputField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool obscureText;
  final String? Function(String?) validator;

  const InputField({
    super.key,
    required this.labelText,
    required this.controller,
    this.obscureText = false,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          style: const TextStyle(
            fontSize: 12, // Set your desired font size
          ),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(12.0), // Set your desired border radius
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 195, 195, 195),
                width: 0.8,
              ),
            ),
            isDense: true,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppStyles.primaryColor),
            ),
          ),
        )
      ],
    );
  }
}
