
import 'package:flutter/material.dart';


typedef MyValidator = String? Function(String?);
typedef OnChange = void Function(String?);
typedef OnTap = void Function();

class CustomFormField extends StatelessWidget {
  final String hintText;
  final MyValidator validator;
  final OnChange? onChange;
  final bool focus;
  final OnTap? onTab;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final IconButton? suffix;
  final Widget? prefix;
  final bool isPassword;
  final FocusNode? passwordFocusNode;
  final bool isRTL;
  const CustomFormField(
      {super.key,
        required this.hintText,
        required this.validator,
        required this.controller,
        required this.isRTL ,
        this.prefix,
        this.keyboardType = TextInputType.text,
        this.suffix,
        this.isPassword = false,
        this.passwordFocusNode,
        this.onChange,
        this.onTab,
        this.focus = false
      });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,

      autofocus: focus,
      controller: controller,
      onTap: onTab,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: isPassword,
      focusNode: passwordFocusNode,
      onChanged: onChange,
      //textDirection: TextDirection,
      style: const TextStyle(color: Colors.black),

      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(5)
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(5)
        ),
        suffixIcon: suffix,
        prefixIcon: prefix,
        //labelText: 'Email',
        labelText: hintText,
        //suffixIcon: ,
        labelStyle:  const TextStyle(color: Colors.black),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        //fillColor:const Color(0xff444444).withOpacity(.08),
        //filled: true
      ),
    );
  }
}
