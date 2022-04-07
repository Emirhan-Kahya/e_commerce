
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';
import '../../widgets/small_text.dart';
import '../../utils/dimension.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        mBigText(
          text: text ,
          size: Dimension.font26,
        ),
        SizedBox(height: Dimension.height10),
        Row(
          children: [
            Wrap(
              children: List.generate(5, (index) {
                return Icon(
                  Icons.star,
                  color: AppColors.mainColor,
                  size: 15,
                );
              }),
            ),
            SizedBox(width: 10),
            mSmallText(text: "4.5"),
            SizedBox(width: 10),
            mSmallText(text: '1234 Comments'),
          ],
        ),
        SizedBox(height: Dimension.height20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
                icon: Icons.circle_sharp,
                text: "normal",
                iconColor: AppColors.iconColor1),
            IconAndTextWidget(
                icon: Icons.location_on,
                text: "1.7km",
                iconColor: AppColors.mainColor),
            IconAndTextWidget(
                icon: Icons.access_time_rounded,
                text: "32min",
                iconColor: AppColors.iconColor2),
          ],
        ),
      ],
    );
  }
}
