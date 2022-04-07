import 'package:e_commerce/widgets/expandable_text.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/dimension.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/app_column.dart';
import '../../widgets/big_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimension.popularfoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/food0.png"),
                ),
              ),
            ),
          ),
          //icon widgets
          Positioned(
            top: Dimension.height45,
            left: Dimension.width20,
            right: Dimension.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
          ),
          //introduction of food
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimension.popularfoodImgSize - 20,
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimension.width20,
                  right: Dimension.width20,
                  top: Dimension.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimension.radius20),
                  topRight: Radius.circular(Dimension.radius20),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: "Chinese Side"),
                  SizedBox(height: Dimension.height20),
                  mBigText(text: "Introduce"),
                  SizedBox(height: Dimension.height10),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableText(
                          text:
                              "Chicken marinated with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par bioled lightly spiced rice. Chicken marinated with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par bioled lightly spiced rice. Chicken marinated with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par bioled lightly spiced rice. Chicken marinated with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par bioled lightly spiced rice. Chicken marinated with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par bioled lightly spiced rice. Chicken marinated with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par bioled lightly spiced rice." ),
                    ),
                  )
                ],
              ),
            ),
          ),
          //expandable text
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimension.bottomHeightBar,
        padding: EdgeInsets.symmetric(
            horizontal: Dimension.width20, vertical: Dimension.height20),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimension.radius20 * 2),
            topRight: Radius.circular(Dimension.radius20 * 2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: Dimension.height20, horizontal: Dimension.width20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.radius20),
                  color: Colors.white),
              child: Row(
                children: [
                  Icon(Icons.remove, color: AppColors.signColor),
                  SizedBox(width: Dimension.width10 / 2),
                  mBigText(text: "0"),
                  SizedBox(width: Dimension.width10 / 2),
                  Icon(Icons.add, color: AppColors.signColor),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimension.width20, vertical: Dimension.height20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.radius20),
                  color: AppColors.mainColor),
              child: mBigText(text: "\$10 | Add to cart", color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
