import 'package:flutter/material.dart';

class BuildTextFormField extends StatelessWidget {
  final bool buyerRegister;
  final double height;
  final String hintText;
  final Widget prefixIcon;
  final bool prefixIconPosition;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final int? maxLines;
  final void Function(String) onChanged;
  final void Function(String?) onSaved;
  final String? Function(String?)? validator;
  const BuildTextFormField({
    super.key,
    required this.height,
    required this.hintText,
    required this.prefixIcon,
    required this.keyboardType,
    required this.controller,
    this.maxLines,
    this.buyerRegister = true,
    this.prefixIconPosition = true,
    required this.onChanged,
    required this.onSaved,
    required this.validator,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: buyerRegister ? const Color(0xFFEFEFF5) : Colors.white,
        // color: Colors.red,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        style: Theme.of(context).textTheme.titleLarge,
        expands: true,
        maxLines: maxLines,
        keyboardType: keyboardType,
        controller: controller,
        onChanged: onChanged,
        onSaved: onSaved,
        validator: validator,
        // textAlign: TextAlign.center,
        // textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: prefixIconPosition
              ? const EdgeInsets.only(top: 0)
              : const EdgeInsets.only(top: 10),
          hintText: hintText,
          isCollapsed: prefixIconPosition ? false : true,
          hintStyle: const TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
          prefixIcon: Padding(
            padding: prefixIconPosition
                ? const EdgeInsets.only(left: 10, top: 4, bottom: 4)
                : const EdgeInsets.only(left: 10, top: 0, bottom: 85),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: prefixIcon,
                ),
                // const Text('*', style: TextStyle(
                //   color: Colors.red,
                // ),)
              ],
            ),
          ),
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue.shade100,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.blue.shade100,
            ),
          ),
        ),
      ),
    );
  }
}
