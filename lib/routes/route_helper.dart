import 'package:e_commerce/pages/address/add_address_page.dart';
import 'package:e_commerce/pages/auth/sign_in_page.dart';
import 'package:e_commerce/pages/cart/cart_page.dart';
import 'package:e_commerce/pages/food/popular_food_detail.dart';
import 'package:e_commerce/pages/home/home_page.dart';
import 'package:e_commerce/pages/home/main_screen.dart';
import 'package:e_commerce/pages/splash/splash_screen.dart';
import 'package:get/get.dart';

import '../pages/food/recommended_food_detail.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";
  static const String signInPage = "/sign-in";

  static const String addAddress = "/add-address";

  static String getSplashPage() => '$splashPage';
  static String getInitial() => '$initial';
  static String getPopularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartPage';
  static String getSignInPage() => '$signInPage';
  static String getAddressPage() => '$addAddress';

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(name: initial, page: () => HomeScreen()),
    GetPage(
      name: signInPage,
      page: () {
        return SignInPage();
      },
      transition: Transition.fade,
    ),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters["page"];
        return PopularFoodDetail(pageId: int.parse(pageId!), page: page!);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters["page"];
        return RecommendedFoodDetail(
          pageId: int.parse(pageId!),
          page: page!,
        );
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: cartPage,
      page: () {
        return CartPage();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: addAddress,
      page: (){
        return AddAddressPage();
      }
    ),
  ];
}
