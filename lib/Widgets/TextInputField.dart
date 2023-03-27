import 'package:calori_fit/styles/Colors.dart';
import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController tec;
  final bool isPass;
  final String hintText;
  final TextInputType tit;
  final String helperText;

  const TextInputField(
      {Key? key,
      this.helperText = "",
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
      cursorColor: maingreen,
      controller: tec,
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: Colors.white),
        hintText: hintText,
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        border: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        // helperText: helperText,
        // border: inputBorder.,
        // focusedBorder: InputBorder.none,
        // enabledBorder: InputBorder.none,
        filled: false,
        contentPadding: const EdgeInsets.all(8),
      ),
      obscureText: isPass,
      keyboardType: tit,
    );
  }
}
