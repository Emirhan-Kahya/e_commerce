import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/dimension.dart';
import 'package:e_commerce/widgets/account_widget.dart';
import 'package:e_commerce/widgets/app_icon.dart';
import 'package:e_commerce/widgets/big_text.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: mBigText(
          text: "Profile",
          size: 24,
          color: Colors.white,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimension.height20),
        child: Column(
          children: [
            //profile icon
            AppIcon(
              icon: Icons.person,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: Dimension.height15 * 5,
              size: Dimension.height15 * 10,
            ),
            SizedBox(height: Dimension.height30),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //name
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.person,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: Dimension.height10 * 5 / 2,
                        size: Dimension.height10 * 5,
                      ),
                      bigText: mBigText(text: "Name"),
                    ),
                    SizedBox(height: Dimension.height20),
                    //phone
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.phone,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimension.height10 * 5 / 2,
                        size: Dimension.height10 * 5,
                      ),
                      bigText: mBigText(text: "0555555555"),
                    ),
                    SizedBox(height: Dimension.height20),
                    //email
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.email,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimension.height10 * 5 / 2,
                        size: Dimension.height10 * 5,
                      ),
                      bigText: mBigText(text: "asdas@gmail.com"),
                    ),
                    SizedBox(height: Dimension.height20),
                    //address
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.location_on,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimension.height10 * 5 / 2,
                        size: Dimension.height10 * 5,
                      ),
                      bigText: mBigText(text: "Fill your address"),
                    ),
                    SizedBox(height: Dimension.height20),
                    //message
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.message_outlined,
                        backgroundColor: Colors.redAccent,
                        iconColor: Colors.white,
                        iconSize: Dimension.height10 * 5 / 2,
                        size: Dimension.height10 * 5,
                      ),
                      bigText: mBigText(text: "Any message"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
