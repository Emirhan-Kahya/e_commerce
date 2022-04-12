import 'package:e_commerce/controllers/cart_controller.dart';
import 'package:e_commerce/pages/home/main_screen.dart';
import 'package:e_commerce/utils/app_constants.dart';
import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/dimension.dart';
import 'package:e_commerce/widgets/app_icon.dart';
import 'package:e_commerce/widgets/big_text.dart';
import 'package:e_commerce/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: Dimension.width20,
            right: Dimension.width20,
            top: Dimension.height20 * 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimension.icon16,
                ),
                SizedBox(width: Dimension.width20 * 6),
                GestureDetector(
                  onTap: (){
                    Get.to(()=>MainScreen());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimension.icon16,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimension.icon16,
                ),
              ],
            ),
          ),
          Positioned(
            top: Dimension.height20 * 5,
            left: Dimension.width20,
            right: Dimension.width20,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimension.height15),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartController>(builder: (cartController){
                  return ListView.builder(
                    itemCount: cartController.getItems.length,
                    itemBuilder: (_, index){
                      return Container(
                        height: Dimension.height20 * 5,
                        width: double.maxFinite,
                        child: Row(
                          children: [
                            Container(
                              width: Dimension.height20 * 5,
                              height: Dimension.height20 * 5,
                              margin: EdgeInsets.only(bottom: Dimension.height10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(Dimension.radius20),
                                color: Colors.white,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    AppConstants.BASE_URL + AppConstants.UPLOAD_URL + cartController.getItems[index].img!,
                                  )
                                ),
                              ),
                            ),
                            SizedBox(width:   Dimension.width10),
                            Expanded(child: Container(
                              height: Dimension.height20 * 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  mBigText(text: cartController.getItems[index].name!, color: Colors.black54,),
                                  mSmallText(text: "Spicy"),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      mBigText(text: "\$ " + cartController.getItems[index].price.toString(), color: Colors.redAccent,),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: Dimension.height10,
                                            horizontal: Dimension.width10),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(Dimension.radius20),
                                            color: Colors.white),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                //popularProduct.setQuantity(false);
                                              },
                                              child: Icon(Icons.remove, color: AppColors.signColor),
                                            ),
                                            SizedBox(width: Dimension.width10 / 2),
                                            mBigText(text: "0"), //popularProduct.inCartItems.toString()),
                                            SizedBox(width: Dimension.width10 / 2),
                                            GestureDetector(
                                              onTap: () {
                                                //popularProduct.setQuantity(true);
                                              },
                                              child: Icon(Icons.add, color: AppColors.signColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),),
                          ],
                        ),
                      );
                    },
                  );
                })
              ),
          ),),
        ],
      ),
    );
  }
}
