import 'package:get/get.dart';

import '../models/products_model.dart';
import '../data/repository/popular_product_repo.dart';


class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity=>_quantity;


  Future<void> getPopularProductList() async{
    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode == 200){
      print("got data");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    }
    else{

    }
  }

  void setQuantity(bool isIncrement){
    if(isIncrement){
      _quantity = _quantity+1;
    }
    else{
      _quantity = _quantity-1;
    }
    update();
  }
}