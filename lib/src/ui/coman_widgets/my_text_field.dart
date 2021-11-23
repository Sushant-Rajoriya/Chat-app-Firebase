import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String labelText;
  final TextInputType keyboardType;
  final bool isPassword;
  final TextEditingController controller;
  final Icon icon;
  const MyTextField({
    Key? key,
    required this.labelText,
    required this.keyboardType,
    required this.isPassword,
    required this.controller,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        style: const TextStyle(color: Colors.black),
        cursorColor: Colors.black,
        decoration: InputDecoration(
            prefixIcon: icon,
            hintText: labelText,
            hintStyle: const TextStyle(fontSize: 20.0, color: Colors.black12),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.5),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple, width: 2.0),
            )),
        keyboardType: keyboardType,
        obscureText: isPassword,
        controller: controller,
      ),
    );
  }
}
