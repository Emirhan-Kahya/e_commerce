import 'package:get/get.dart';

class Dimension{
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  //container
  static double pageViewContainer = screenHeight / 3.84;
  static double pageTextContainer = screenHeight / 7.03;
  static double pageView = screenHeight / 2.64;

  //height
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.13;
  static double height45 = screenHeight / 18.7;

  //width
  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 56.27;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 28.13;
  static double width45 = screenHeight / 18.7;

  //font
  static double font12 = screenHeight / 70.2;
  static double font16 = screenHeight / 47.94;
  static double font20 = screenHeight / 42.2;
  static double font26 = screenHeight / 29.5;


  //radius
  static double radius15 = screenHeight / 56.27;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;

  //icon
  static double icon16 = screenHeight / 47.93;
  static double icon24 = screenHeight / 35.7;
  //listview
  static double listViewImgSize = screenWidth / 3.25;
  static double listViewTextContSize = screenWidth / 3.9;

  //popular food
  static double popularFoodImgSize = screenHeight / 2.41;

  //bottom height
  static double bottomHeightBar = screenHeight / 6.63;
}