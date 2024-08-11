
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
  const CustomFormField(
      {super.key,
      required this.hintText,
      required this.validator,
      required this.controller,
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
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
        fontSize: 16,
      ),
      autofocus: focus,
      controller: controller,
      onTap: onTab,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: isPassword,
      focusNode: passwordFocusNode,
      onChanged: onChange,
        decoration: InputDecoration(
          labelText: hintText,
          labelStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 16,
          ),

        )
    );
  }
}
