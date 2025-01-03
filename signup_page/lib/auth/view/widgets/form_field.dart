import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {

  const CustomFormField({super.key,  required this.controller, required this.validator, required this.labelText});
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}