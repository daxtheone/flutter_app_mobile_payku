import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final bool obscureText;
  final String? errorMessage;
  final Function(String)? onChaged;
  final String? Function(String?)? validator;


  const CustomTextFormField({super.key, this.label, this.hint, this.errorMessage, this.onChaged, this.validator, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    final enableBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    );
    final focusedBorder = UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 2)
    );
    final errorBorder = UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2)
    );

    return TextFormField(
      onChanged: onChaged,
      validator: validator,
      obscureText: obscureText ,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 8),
        enabledBorder: enableBorder,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: errorBorder,
        label: label != null ? Text(label!) : null,
        hintText: hint,
        focusColor: Colors.white,
        errorText: errorMessage,
      ),
    );
  }
}