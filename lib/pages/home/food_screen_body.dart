
import 'package:e_commerce/controllers/popular_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../utils/dimension.dart';
import '../../widgets/app_column.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class FoodScreenBody extends StatefulWidget {
  const FoodScreenBody({Key? key}) : super(key: key);

  @override
  State<FoodScreenBody> createState() => _FoodScreenBodyState();
}

class _FoodScreenBodyState extends State<FoodScreenBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPage = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimension.pageViewContainer;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPage = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider section
        GetBuilder<PopularProductController>(builder:(popularProducts){
          return Container(
            height: Dimension.pageView,
            child: PageView.builder(
              controller: pageController,
              itemCount: popularProducts.popularProductList.length,
              itemBuilder: (context, index) {
                return _buildPageItem(index);
              },
            ),
          );
        }),
        //dots
        GetBuilder<PopularProductController>(builder: (popularProducts){
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.length,
            position: _currentPage,
            decorator: DotsDecorator(
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                activeColor: AppColors.mainColor),
          );
        }),

        //popular text
        SizedBox(height: Dimension.height30),
        Container(
          margin: EdgeInsets.only(left: Dimension.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              mBigText(text: "Popular"),
              SizedBox(width: Dimension.width10),
              Container(
                margin: EdgeInsets.only(bottom: 3),
                child: mBigText(
                  text: ".",
                  size: Dimension.font20,
                  color: Colors.black26,
                ),
              ),
              SizedBox(width: Dimension.width10),
              mSmallText(text: "Food pairing"),
            ],
          ),
        ),
        //list of foods
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index){
          return Container(
            margin: EdgeInsets.only(left: Dimension.width20, right: Dimension.width20, bottom: Dimension.height10),
            child: Row(
              children: [
                //image
                Container(
                  width: Dimension.listViewImgSize,
                  height: Dimension.listViewImgSize,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimension.radius20),
                    color: Colors.white38,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assets/image/food0.png"
                      ),
                    )
                  ),
                ),
                //text
                Expanded(
                  child: Container(
                    height: Dimension.listViewTextContSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimension.radius20),
                        bottomRight: Radius.circular(Dimension.radius20),
                      ),
                      color: Colors.white
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: Dimension.width10, right: Dimension.width10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          mBigText(text: "Nutrutious fruit meal in China"),
                          SizedBox(height: Dimension.height10),
                          mSmallText(text: "With Chinese characteristics"),
                          SizedBox(height: Dimension.height10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconAndTextWidget(
                                  icon: Icons.circle_sharp,
                                  text: "normal",
                                  iconColor: AppColors.iconColor1),
                              IconAndTextWidget(
                                  icon: Icons.location_on,
                                  text: "1.7",
                                  iconColor: AppColors.mainColor),
                              IconAndTextWidget(
                                  icon: Icons.access_time_rounded,
                                  text: "32min",
                                  iconColor: AppColors.iconColor2),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currentPage.floor()) {
      var curScale = 1 - (_currentPage - index) * (1 - _scaleFactor);
      var curTrans = _height * (1 - curScale) / 2;
      matrix = Matrix4.diagonal3Values(1, curScale, 1)
        ..setTranslationRaw(0, curTrans, 0);
    } else if (index == _currentPage.floor() + 1) {
      var curScale =
          _scaleFactor + (_currentPage - index + 1) * (1 - _scaleFactor);
      var curTrans = _height * (1 - curScale) / 2;
      matrix = Matrix4.diagonal3Values(1, curScale, 1);
      matrix = Matrix4.diagonal3Values(1, curScale, 1)
        ..setTranslationRaw(0, curTrans, 0);
    } else if (index == _currentPage.floor() - 1) {
      var curScale = 1 - (_currentPage - index) * (1 - _scaleFactor);
      var curTrans = _height * (1 - curScale) / 2;
      matrix = Matrix4.diagonal3Values(1, curScale, 1);
      matrix = Matrix4.diagonal3Values(1, curScale, 1)
        ..setTranslationRaw(0, curTrans, 0);
    } else {
      var curScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, curScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimension.pageViewContainer,
            margin: EdgeInsets.symmetric(horizontal: Dimension.width10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimension.radius30),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/image/food0.png"),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimension.pageTextContainer,
              margin: EdgeInsets.only(
                  right: Dimension.width30,
                  left: Dimension.width30,
                  bottom: Dimension.height30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.radius20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimension.height15, left: 15, right: 15),
                child: AppColumn(text: "Chinese Side"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
