import 'package:flutter/material.dart';

//class CustomFormTextField extends StatefulWidget {
class CustomFormTextField extends StatelessWidget {
  final String? Function(String? value)? validator;
  // final String? Function(String? value)? decoration;
  //final TextEditingController controller;
  // final InputDecoration inputDecoration;
  //final bool isValid;
  final String? label;
  final String? hint;
  final String? errorText;
  final bool obscureText;

  final Function(String)? onChanged;
  final Function(String)? onSubmitted;

  const CustomFormTextField({
    this.validator,
    //this.decoration,
    //required this.isValid,
    //required this.inputDecoration,
    this.label,
    this.obscureText = false,
    this.hint,
    this.errorText,
    this.onChanged,
    this.onSubmitted,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: controller,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        //   labelText: widget.label,
        label: label != null ? Text(label!) : null,
        hintText: hint,
        errorText: errorText,
      ),
      onChanged: onChanged,
      // onFieldSubmitted: widget.onSubmitted,
    );
  }

  // @override
//  State<CustomFormTextField> createState() => _CustomFormFieldState();
}

//class _CustomFormFieldState extends State<CustomFormTextField> {
 

