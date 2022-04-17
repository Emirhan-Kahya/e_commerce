import 'package:e_commerce/pages/auth/sign_up_page.dart';
import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/dimension.dart';
import 'package:e_commerce/widgets/app_text_widget.dart';
import 'package:e_commerce/widgets/big_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var passwordController = TextEditingController();
    var phoneController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: Dimension.screenHeight * 0.05,
            ),
            //app logo
            Container(
              height: Dimension.screenHeight * 0.25,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: Dimension.height20 * 4,
                  backgroundImage: AssetImage("assets/image/logo part 1.png"),
                ),
              ),
            ),
            Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(left: Dimension.width20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello",
                    style: TextStyle(
                      fontSize: Dimension.font20 * 3 + Dimension.font20 / 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Sign into your account",
                    style: TextStyle(
                      fontSize: Dimension.font20,
                      //fontWeight: FontWeight.bold,
                      color: Colors.grey[500]
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Dimension.height20),
            //password
            AppTextField(
              textController: passwordController,
              text: "Password",
              icon: Icons.password_sharp,
            ),
            SizedBox(height: Dimension.height20),
            //phone
            AppTextField(
              textController: phoneController,
              text: "Phone",
              icon: Icons.phone,
            ),
            SizedBox(height: Dimension.height20),
            //tag line
            Row(
              children: [
                Expanded(child: Container()),
                RichText(
                  text: TextSpan(
                    text: "Sign into your account",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: Dimension.font20,
                    ),
                  ),
                ),
                SizedBox(width: Dimension.width20),
              ],
            ),
            SizedBox(height: Dimension.height20),
            //sign in button
            Container(
              width: Dimension.screenWidth / 2,
              height: Dimension.screenHeight / 13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.radius30),
                color: AppColors.mainColor,
              ),
              child: Center(
                child: mBigText(
                  text: "Sign In",
                  size: Dimension.font20 + Dimension.font20 / 2,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: Dimension.screenHeight * 0.05),
            //sing in to sign up
            RichText(
              text: TextSpan(
                text: "Don\'t have an account? ",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: Dimension.font20,
                ),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpPage(), transition: Transition.fade),
                    text: "Create",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.mainBlackColor,
                      fontSize: Dimension.font20,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
