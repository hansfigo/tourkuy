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
        Text(
          labelText,
          style: const TextStyle(color: AppStyles.primaryColor),
        ),
        const SizedBox(height: 6),
        TextFormField(
            controller: controller,
            obscureText: obscureText,
            validator: validator,
            style: const TextStyle(
              fontSize: 12,
            ),
            decoration: AppStyles.inputTextStyle)
      ],
    );
  }
}
