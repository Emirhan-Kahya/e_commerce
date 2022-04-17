import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/dimension.dart';
import 'package:e_commerce/widgets/big_text.dart';
import 'package:e_commerce/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';
import 'food_screen_body.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future<void> _loadResource() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        child: Column(
          children: [
            //header
            Container(
              child: Container(
                margin: EdgeInsets.only(
                    top: Dimension.height45, bottom: Dimension.height15),
                padding: EdgeInsets.symmetric(horizontal: Dimension.width20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        mBigText(text: "Country", color: AppColors.mainColor),
                        Row(
                          children: [
                            mSmallText(
                              text: "City",
                              color: Colors.black54,
                            ),
                            Icon(Icons.arrow_drop_down_rounded),
                          ],
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        width: Dimension.height45,
                        height: Dimension.height45,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimension.radius15),
                            color: AppColors.mainColor),
                        child: Icon(Icons.search,
                            color: Colors.white, size: Dimension.icon24),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //slider
            Expanded(
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: FoodScreenBody(),
              ),
            ),
          ],
        ),
        onRefresh: _loadResource,
      ),
    );
  }
}
