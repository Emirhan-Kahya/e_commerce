import 'package:e_commerce/utils/dimension.dart';
import 'package:e_commerce/widgets/app_icon.dart';
import 'package:e_commerce/widgets/big_text.dart';
import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  AppIcon appIcon;
  mBigText bigText;
  AccountWidget({Key? key, required this.appIcon, required this.bigText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: Dimension.width20,
          top: Dimension.width10,
          bottom: Dimension.width10,
      ),
      child: Row(
        children: [
          appIcon,
          SizedBox(width: Dimension.width15),
          bigText,
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
          BoxShadow(
            blurRadius: 1,
            offset: Offset(0, 2),
            color: Colors.grey.withOpacity(0.2)
          ),
        ]
      ),
    );
  }
}
