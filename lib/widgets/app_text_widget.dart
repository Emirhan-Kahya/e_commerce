import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimension.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textController;
  final String text;
  final IconData icon;
  bool isObscure;
  AppTextField({
    Key? key,
    required this.textController,
    required this.text,
    required this.icon,
    this.isObscure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(left: Dimension.height20, right: Dimension.height20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimension.radius15),
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              spreadRadius: 1 ,
              offset: Offset(1, 1),
              color: Colors.grey.withOpacity(0.2),
            ),
          ]),
      child: TextField(
        obscureText: isObscure ? true : false,
        controller: textController,
        decoration: InputDecoration(
          hintText: text,
          prefixIcon: Icon(
            icon,
            color: AppColors.yellowColor,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimension.radius15),
            borderSide: BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimension.radius15),
            borderSide: BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimension.radius15),
          ),
        ),
      ),
    );
  }
}
