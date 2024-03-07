import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/styles/color_styles.dart';

class PasswordTextFields extends StatefulWidget {
  final TextEditingController passwordController;

  const PasswordTextFields({
    Key? key,
    required this.passwordController,
   });

  @override
  State<PasswordTextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<PasswordTextFields> {
  bool _passwordVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 44,
      child: TextFormField(
        controller: widget.passwordController,
        keyboardType: TextInputType.visiblePassword,
        style: GoogleFonts.outfit(
          fontSize: 14,
          color: ColorStyles.greyText,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16),
          prefixIcon: Icon(
            Icons.lock_outlined,
            color: ColorStyles.greyText,
            size: 16,
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                if (_passwordVisible) {
                  _passwordVisible = false;
                } else {
                  _passwordVisible = true;
                }
              });
            },
            child: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: ColorStyles.greyText,
              size: 16,
            ),
          ),
          hintText: "Masukkan Password",
          hintStyle: TextStyle(
            color: ColorStyles.greyText,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: ColorStyles.greyOutline, // Unfocused border color
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: ColorStyles.greyOutline, // Focused border color
            ),
          ),
        ),
        obscureText: !_passwordVisible,
      ),
    );
  }
}