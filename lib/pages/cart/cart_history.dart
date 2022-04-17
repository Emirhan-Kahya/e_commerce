import 'dart:convert';

import 'package:e_commerce/base/no_data_page.dart';
import 'package:e_commerce/controllers/cart_controller.dart';
import 'package:e_commerce/models/cart_model.dart';
import 'package:e_commerce/routes/route_helper.dart';
import 'package:e_commerce/utils/app_constants.dart';
import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/dimension.dart';
import 'package:e_commerce/widgets/app_icon.dart';
import 'package:e_commerce/widgets/big_text.dart';
import 'package:e_commerce/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList =
        Get.find<CartController>().getCartHistoryList().reversed.toList();
    Map<String, int> cartItemsPerOrder = Map();
    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }
    List<int> cartItemsPerOrderToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<String> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.key).toList();
    }

    List<int> itemsPerOrder = cartItemsPerOrderToList();

    var listCounter = 0;

    Widget timeWidget(int index) {
      var outputDate = DateTime.now().toString();
      if(index<getCartHistoryList.length){
        DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm:ss").parse(getCartHistoryList[listCounter].time!);
        var inputDate = DateTime.parse(parseDate.toString());
        var outputFormat = DateFormat("MM/dd/yyyy hh:mm a");
        outputDate = outputFormat.format(inputDate);
      }
      return mBigText(text: outputDate.toString());
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
            color: AppColors.mainColor,
            width: double.maxFinite,
            height: Dimension.height10 * 10,
            padding: EdgeInsets.only(top: Dimension.height45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                mBigText(
                  text: "Cart History",
                  color: Colors.white,
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: AppColors.mainColor,
                  backgroundColor: AppColors.yellowColor,
                )
              ],
            ),
          ),
          GetBuilder<CartController>(builder: (_cartController) {
            return _cartController.getCartHistoryList().length > 0
                ? Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                        top: Dimension.height20,
                        left: Dimension.width20,
                        right: Dimension.width20,
                      ),
                      child: MediaQuery.removePadding(
                        removeTop: true,
                        context: context,
                        child: ListView(
                          children: [
                            for (int i = 0; i < itemsPerOrder.length; i++)
                              Container(
                                height: Dimension.height30 * 4,
                                margin:
                                    EdgeInsets.only(bottom: Dimension.height20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    timeWidget(listCounter),
                                    SizedBox(height: Dimension.height10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Wrap(
                                          direction: Axis.horizontal,
                                          children: List.generate(
                                              itemsPerOrder[i], (index) {
                                            if (listCounter <
                                                getCartHistoryList.length) {
                                              listCounter++;
                                            }
                                            return index <= 2
                                                ? Container(
                                                    height:
                                                        Dimension.height20 * 4,
                                                    width:
                                                        Dimension.width20 * 4,
                                                    margin: EdgeInsets.only(
                                                        right:
                                                            Dimension.width10 /
                                                                2),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .circular(Dimension
                                                                  .radius15 /
                                                              2),
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(AppConstants
                                                                .BASE_URL +
                                                            AppConstants
                                                                .UPLOAD_URL +
                                                            getCartHistoryList[
                                                                    listCounter -
                                                                        1]
                                                                .img!),
                                                      ),
                                                    ),
                                                  )
                                                : Container();
                                          }),
                                        ),
                                        Container(
                                          height: Dimension.height20 * 4,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              mSmallText(
                                                text: "Total",
                                                color: AppColors.titleColor,
                                              ),
                                              mBigText(
                                                text: itemsPerOrder[i]
                                                        .toString() +
                                                    " Items",
                                                color: AppColors.titleColor,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  var orderTime =
                                                      cartOrderTimeToList();
                                                  Map<int, CartModel>
                                                      moreOrder = {};
                                                  for (int j = 0;
                                                      j <
                                                          getCartHistoryList
                                                              .length;
                                                      j++) {
                                                    if (getCartHistoryList[j]
                                                            .time ==
                                                        orderTime[i]) {
                                                      moreOrder.putIfAbsent(
                                                          getCartHistoryList[j]
                                                              .id!, () {
                                                        return CartModel
                                                            .fromJson(
                                                          jsonDecode(
                                                            jsonEncode(
                                                              getCartHistoryList[
                                                                  j],
                                                            ),
                                                          ),
                                                        );
                                                      });
                                                    }
                                                  }
                                                  Get.find<CartController>()
                                                      .setItems = moreOrder;
                                                  Get.find<CartController>()
                                                      .addToCartList();
                                                  Get.toNamed(
                                                      RouteHelper.cartPage);
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          Dimension.width10,
                                                      vertical:
                                                          Dimension.height10 /
                                                              2),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Dimension.radius15 /
                                                                3),
                                                    border: Border.all(
                                                        width: 1,
                                                        color: AppColors
                                                            .mainColor),
                                                  ),
                                                  child: mSmallText(
                                                    text: "one more",
                                                    color: AppColors.mainColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                          ],
                        ),
                      ),
                    ),
                  )
                : Container(
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: NoDataPage(
                      text: "You didn't buy anything so far!",
                      imgPath: "assets/image/empty_box.png",
                    ),
                  );
          }),
        ],
      ),
    );
  }
}
