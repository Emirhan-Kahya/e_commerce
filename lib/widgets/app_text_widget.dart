import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimension.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textController;
  final String text;
  final IconData icon;
  AppTextField({
    Key? key,
    required this.textController,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(left: Dimension.height20, right: Dimension.height20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimension.radius30),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: 7,
              offset: Offset(1, 10),
              color: Colors.grey.withOpacity(0.2),
            ),
          ]),
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          hintText: text,
          prefixIcon: Icon(
            icon,
            color: AppColors.yellowColor,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimension.radius30),
            borderSide: BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimension.radius30),
            borderSide: BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimension.radius30),
          ),
        ),
      ),
    );
  }
}
