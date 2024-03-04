import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFields extends StatefulWidget {
  final TextEditingController textEditingController;
  final String text;
  final TextInputType textInputType;
  final Icon icon;

  const TextFields({
    Key? key,
    required this.textEditingController,
    required this.text,
    required this.textInputType,
    required this.icon,
  }) : super(key: key);

  @override
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: TextFormField(
        controller: widget.textEditingController,
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16),
          prefixIcon: widget.icon,
          hintText: widget.text,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          )
        ),
      ),
    );
  }
}