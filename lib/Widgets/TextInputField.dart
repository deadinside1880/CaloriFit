import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController tec;
  final bool isPass;
  final String hintText;
  final TextInputType tit;

  const TextInputField(
      {Key? key,
      this.hintText = "",
      this.isPass = false,
      required this.tec,
      required this.tit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      controller: tec,
      decoration: InputDecoration(
        hintText: hintText,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: false,
        contentPadding: const EdgeInsets.all(8),
      ),
      obscureText: isPass,
      keyboardType: tit,
    );
  }
}