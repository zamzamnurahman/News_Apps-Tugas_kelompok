import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  TextEditingController controller;
  String label;
  String? Function(String?)? validator;

  FormWidget({
    super.key,
    required this.controller,
    required this.label,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          label: Text(label),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
        ),
        validator: validator,
      ),
    );
  }
}
