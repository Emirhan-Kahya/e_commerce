import 'package:e_commerce/base/no_data_page.dart';
import 'package:e_commerce/controllers/auth_controller.dart';
import 'package:e_commerce/controllers/cart_controller.dart';
import 'package:e_commerce/controllers/popular_product_controller.dart';
import 'package:e_commerce/controllers/recommended_product_controller.dart';
import 'package:e_commerce/utils/app_constants.dart';
import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/dimension.dart';
import 'package:e_commerce/widgets/app_icon.dart';
import 'package:e_commerce/widgets/big_text.dart';
import 'package:e_commerce/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/route_helper.dart';

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
                    Get.toNamed(RouteHelper.getInitial());
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
          GetBuilder<CartController>(builder: (_cartController){
            return _cartController.getItems.length > 0 ? Positioned(
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
                      var _cartList = cartController.getItems;
                      return ListView.builder(
                        itemCount: _cartList.length,
                        itemBuilder: (_, index){
                          return Container(
                            height: Dimension.height20 * 5,
                            width: double.maxFinite,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap:(){
                                    var popularIndex = Get.find<PopularProductController>()
                                        .popularProductList
                                        .indexOf(_cartList[index].product!);

                                    if(popularIndex >= 0){
                                      Get.toNamed(RouteHelper.getPopularFood(popularIndex, "cartpage"));
                                    }
                                    else{
                                      var recommendedIndex = Get.find<RecommendedProductController>()
                                          .recommendedProductList
                                          .indexOf(_cartList[index].product!);
                                      if(recommendedIndex<0){
                                        Get.snackbar("History Product", "Product review is not available for history products",
                                            backgroundColor: AppColors.mainColor, colorText: Colors.white);
                                      }
                                      else{
                                        Get.toNamed(RouteHelper.getRecommendedFood(recommendedIndex, "cartpage"));
                                      }
                                    }
                                  },
                                  child: Container(
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
                                                    cartController.addItem(_cartList[index].product!, -1);
                                                  },
                                                  child: Icon(Icons.remove, color: AppColors.signColor),
                                                ),
                                                SizedBox(width: Dimension.width10 / 2),
                                                mBigText(text: _cartList[index].quantity.toString()), //popularProduct.inCartItems.toString()),
                                                SizedBox(width: Dimension.width10 / 2),
                                                GestureDetector(
                                                  onTap: () {
                                                    cartController.addItem(_cartList[index].product!, 1);
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
              ),) : NoDataPage(text: "Your cart is empty!");
          },)
          
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(builder: (cartController) {
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
          child: cartController.getItems.length > 0 ? Row(
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
                    SizedBox(width: Dimension.width10 / 2),
                    mBigText(text: "\$ " + cartController.totalAmount.toString()),
                    SizedBox(width: Dimension.width10 / 2),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  if(Get.find<AuthController>().userLoggedIn()){
                    cartController.addToHistory();
                  }else{
                    Get.toNamed(RouteHelper.signInPage);
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimension.width20,
                      vertical: Dimension.height20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.radius20),
                      color: AppColors.mainColor),
                  child: mBigText(
                      text: "Check out",//"\$ ${product.price!} | Add to cart",
                      color: Colors.white),
                ),
              ),
            ],
          ): Container()
        );
      }),    );
  }
}
