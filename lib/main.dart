import 'package:e_commerce/controllers/cart_controller.dart';
import 'package:e_commerce/controllers/popular_product_controller.dart';
import 'package:e_commerce/controllers/recommended_product_controller.dart';
import 'package:e_commerce/pages/auth/sign_in_page.dart';
import 'package:e_commerce/pages/auth/sign_up_page.dart';
import 'package:e_commerce/routes/route_helper.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(
        builder: (_) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Food Delivery',
            //home: SignInPage(),
            initialRoute: RouteHelper.getSplashPage(),
            getPages: RouteHelper.routes,
          );
        },
      );
    });
  }
}
