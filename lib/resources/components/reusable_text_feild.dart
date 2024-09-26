import 'package:flutter/material.dart';

class ReusableTextFeild extends StatelessWidget {
  ReusableTextFeild({super.key, required this.hintText, this.controller, this.suffixIcon, this.enableSuffix = false});

  final String hintText;
  TextEditingController? controller;
  Widget? suffixIcon;
  bool enableSuffix;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 1)
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: const Icon(Icons.search),
          suffixIcon: enableSuffix? suffixIcon : const SizedBox(),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
        ),
      ),
    );
  }
}
