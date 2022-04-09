import 'package:e_commerce/utils/app_constants.dart';
import 'package:get/get.dart';

import '../data/api/api_client.dart';
import '../data/repository/popular_product_repo.dart';
import '../controllers/popular_product_controller.dart';

Future<void> init()async{
  //api client
  Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(()=>PopularProductRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(()=>PopularProductController(popularProductRepo: Get.find()));
}