import 'package:e_commerce/base/custom_loader.dart';
import 'package:e_commerce/base/show_custom_snackbar.dart';
import 'package:e_commerce/controllers/auth_controller.dart';
import 'package:e_commerce/models/sign_up_model.dart';
import 'package:e_commerce/routes/route_helper.dart';
import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/dimension.dart';
import 'package:e_commerce/widgets/app_text_widget.dart';
import 'package:e_commerce/widgets/big_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signUpImages = [
      "t.png",
      "f.png",
      "g.png",
    ];

    void _registration(AuthController authController) {
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (email.isEmpty) {
        showCustomSnackBar("Type in your email address", title: "Email");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Type in a valid email address", title: "Email");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type in your password", title: "Password");
      } else if (password.length < 6) {
        showCustomSnackBar("Password can not be less than six characters ",
            title: "Password");
      } else if (name.isEmpty) {
        showCustomSnackBar("Type in your name", title: "Name");
      } else if (phone.isEmpty) {
        showCustomSnackBar("Type in your phone number", title: "Phone");
      } else {
        SignUpBody signUpBody = SignUpBody(
          password: passwordController.text,
          email: emailController.text,
          phone: phoneController.text,
          name: nameController.text,
        );
        authController.registration(signUpBody).then((status){
          if(status.isSuccess){
            Get.toNamed(RouteHelper.getInitial());
          }else{
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (_authController){
        return !_authController.isLoading ? SingleChildScrollView(
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
              //email
              AppTextField(
                textController: emailController,
                text: "Email",
                icon: Icons.email,
              ),
              SizedBox(height: Dimension.height20),
              //password
              AppTextField(
                textController: passwordController,
                text: "Password",
                icon: Icons.password_sharp,
                isObscure: true,
              ),
              SizedBox(height: Dimension.height20),
              //name
              AppTextField(
                textController: nameController,
                text: "Name",
                icon: Icons.person,
              ),
              SizedBox(height: Dimension.height20),
              //phone
              AppTextField(
                textController: phoneController,
                text: "Phone",
                icon: Icons.phone,
              ),
              SizedBox(height: Dimension.height20),
              //sign up button
              GestureDetector(
                onTap: () {
                  _registration(_authController);
                },
                child: Container(
                  width: Dimension.screenWidth / 2,
                  height: Dimension.screenHeight / 13,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimension.radius30),
                    color: AppColors.mainColor,
                  ),
                  child: Center(
                    child: mBigText(
                      text: "Sign up",
                      size: Dimension.font20 + Dimension.font20 / 2,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: Dimension.height10),
              RichText(
                text: TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                  text: "Have an account already?",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: Dimension.font20,
                  ),
                ),
              ),
              SizedBox(height: Dimension.screenHeight * 0.05),
              //sign up options
              RichText(
                text: TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                  text: "Sign up using one of the following methods",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: Dimension.font16,
                  ),
                ),
              ),
              Wrap(
                children: List.generate(
                  3,
                      (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: Dimension.radius30,
                      backgroundImage:
                      AssetImage("assets/image/" + signUpImages[index]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ) : const CustomLoader();
      })
    );
  }
}
