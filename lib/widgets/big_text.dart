import 'package:e_commerce/utils/dimension.dart';
import 'package:flutter/material.dart';

class mBigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;

  mBigText({
    Key? key,
    this.color = const Color(0xFF332d2b),
    required this.text,
    this.overFlow = TextOverflow.ellipsis,
    this.size = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
        color: color,
        fontSize: size == 0 ? Dimension.font20 : size,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto'
      ),
    );
  }
}
