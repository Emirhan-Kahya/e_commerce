import 'package:e_commerce/controllers/popular_product_controller.dart';
import 'package:e_commerce/pages/food/recommended_food_detail.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/pages/food/popular_food_detail.dart';

import 'helper/dependencies.dart' as dep;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RecommendedFoodDetail(),
    );
  }
}
