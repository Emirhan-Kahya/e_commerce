import 'package:e_commerce/controllers/popular_product_controller.dart';
import 'package:e_commerce/pages/home/main_screen.dart';
import 'package:e_commerce/utils/app_constants.dart';
import 'package:e_commerce/widgets/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../utils/dimension.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/app_column.dart';
import '../../widgets/big_text.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  const PopularFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
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
              height: Dimension.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(AppConstants.BASE_URL +
                      AppConstants.UPLOAD_URL +
                      product.img!),
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
                GestureDetector(
                    onTap: () {
                      Get.to(() => MainScreen());
                    },
                    child: AppIcon(icon: Icons.arrow_back_ios)),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
          ),
          //introduction of food
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimension.popularFoodImgSize - 20,
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
                  AppColumn(text: product.name!),
                  SizedBox(height: Dimension.height20),
                  mBigText(text: "Introduce"),
                  SizedBox(height: Dimension.height10),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableText(text: product.description!),
                    ),
                  )
                ],
              ),
            ),
          ),
          //expandable text
        ],
      ),
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (popularProduct) {
        return Container(
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
                    vertical: Dimension.height20,
                    horizontal: Dimension.width20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimension.radius20),
                    color: Colors.white),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        popularProduct.setQuantity(false);
                      },
                      child: Icon(Icons.remove, color: AppColors.signColor),
                    ),
                    SizedBox(width: Dimension.width10 / 2),
                    mBigText(text: popularProduct.quantity.toString()),
                    SizedBox(width: Dimension.width10 / 2),
                    GestureDetector(
                      onTap: () {
                        popularProduct.setQuantity(true);
                      },
                      child: Icon(Icons.add, color: AppColors.signColor),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimension.width20,
                    vertical: Dimension.height20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimension.radius20),
                    color: AppColors.mainColor),
                child: mBigText(
                    text: "\$ ${(product.price! ) * popularProduct.quantity} | Add to cart",
                    color: Colors.white),
              ),
            ],
          ),
        );
      }),
    );
  }
}
