import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:noor_e_quran/constants/colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:noor_e_quran/controllers/login_controllers.dart';
import 'package:noor_e_quran/widgets/round_button.dart';
import 'package:noor_e_quran/widgets/text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _loginController = Get.put(LoginController());

  bool isPassHidden = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   // systemOverlayStyle: SystemUiOverlayStyle(
      //   //       statusBarColor: AppColors.primaryColor,
      //   //       systemNavigationBarColor: AppColors.transparent,
      //   //     ),
      //   toolbarHeight: 11,
      //   backgroundColor: AppColors.primaryColor,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // Stack(
                //   children: [
                //     Center(child: Text("Login", style: AppColors.appBarWhiteStyle.copyWith(fontSize: 22),)),
                //     Container(
                //       height: height * 0.3,
                //       width: double.infinity,
                //       decoration: BoxDecoration(
                //         color: AppColors.primaryColor,
                //         borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70)),
                //       ),
                //       child: Center(
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           crossAxisAlignment: CrossAxisAlignment.center,
                //           children: [
                //             Icon(
                //                 FlutterIslamicIcons.solidMuslim,
                //               size: 90,
                //               color: AppColors.whiteColor,
                //             ),
                //             SizedBox(height: 5,),
                //             Text("Login", style: AppColors.appBarWhiteStyle.copyWith(fontSize: 30),)
                //           ],
                //         ),
                //       ),
                //     ),
                //   ],
                // ),

                Container(
                  height: height * 0.4,
                  width: double.infinity,
                  color: AppColors.primaryColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        child: Image(
                          fit: BoxFit.cover,
                          height: 200,
                          width: 200,
                          image: AssetImage("assets/images/Noor_Logo.png"),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      // Text("Enter your email address \n to connect to Quran Kareem.",
                      // textAlign: TextAlign.center,
                      // style: AppColors.whiteStyle.copyWith(fontSize: 20, color: AppColors.whiteColor.withOpacity(0.7)),
                      // )
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 15,
                    ).copyWith(top: height * 0.265),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          opacity: 0.02,
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/bg_para.png"),
                        ),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 8,
                              spreadRadius: 0.5,
                              color: Colors.black.withOpacity(0.7))
                        ],
                        color: AppColors.darkBackgroundColor,
                        borderRadius: BorderRadius.circular(20)),
                    height: height * 0.52,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Login",
                            style: AppColors.appBarWhiteStyle
                                .copyWith(fontSize: 27),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          // Text("Login to your account\nto connect with Qura'an", style: AppColors.whiteStyle.copyWith(fontSize: 18, color: AppColors.whiteColor.withOpacity(0.8)),),
                          Text(
                            "Enter you details to Login!",
                            style: AppColors.whiteStyle.copyWith(
                                fontSize: 19,
                                color: AppColors.whiteColor.withOpacity(0.8)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Form(
                            key: _loginController.formKey,
                            child: Column(
                              children: [
                                CustomTextField(
                                  focusedColor: AppColors.primaryColor,
                                  controller: _loginController.emailController,
                                  inputType: TextInputType.emailAddress,
                                  onSave: (value) {
                                    _loginController.email = value!;
                                  },
                                  onValidator: (value) {
                                    return _loginController.validEmail(value!);
                                  },
                                  isAutoCorrect: false,
                                  hint: "Enter Email Address",
                                  obscure: false,
                                  preIcon: Icon(
                                    EvaIcons.email,
                                    color:
                                        AppColors.whiteColor.withOpacity(0.3),
                                  ),
                                  button: Container(
                                    height: 1,
                                    width: 1,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomTextField(
                                  focusedColor: AppColors.primaryColor,
                                  inputType: TextInputType.visiblePassword,
                                  onValidator: (value) {
                                    return _loginController
                                        .validPassword(value);
                                  },
                                  onSave: (value) {
                                    _loginController.password = value!;
                                  },
                                  isAutoCorrect: false,
                                  hint: "Enter your Password",
                                  controller:
                                      _loginController.passwordController,
                                  preIcon: Icon(
                                    CupertinoIcons.lock_fill,
                                    color:
                                        AppColors.whiteColor.withOpacity(0.3),
                                  ),
                                  button: GestureDetector(
                                    onTap: () {
                                      setState(() {});
                                      isPassHidden = !isPassHidden;
                                    },
                                    child: Container(
                                      // color: AppColors.greyTextColor,
                                      width: 60,
                                      height: 50,
                                      child: Icon(
                                        isPassHidden
                                            ? Icons.visibility_rounded
                                            : Icons.visibility_off_rounded,
                                        color: isPassHidden
                                            ? AppColors.primaryColor
                                            : AppColors.grayColor,
                                      ),
                                    ),
                                  ),
                                  obscure: isPassHidden ? true : false,
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 2,
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: AppColors.primaryColor),
                                  ))),
                          SizedBox(
                            height: 3,
                          ),
                          Column(
                            children: [
                              // RoundButton(
                              //   onTap: (){},
                              //   title: "Login",
                              //   bIcon: Container(height: 1, width: 1,),
                              // ),
                              RoundButtonTwo(
                                onTap: () {
                                  setState(() {});
                                  _loginController.login();
                                },
                                conChild: Obx(
                                  () => _loginController.isLoading.value
                                      ? const Center(
                                          child: SpinKitThreeBounce(
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        )
                                      : Center(
                                          child: Text(
                                            'Login',
                                            style: AppColors.appBarWhiteStyle
                                                .copyWith(fontSize: 20),
                                          ),
                                        ),
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: Container(
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(15),
                              //       color: AppColors.alertColor
                              //     ),
                              //     width: double.infinity,
                              //     height: 50,
                              //     child: ElevatedButton(
                              //       style: ElevatedButton.styleFrom(
                              //         elevation: 5,
                              //         primary: AppColors.primaryColor,
                              //         onPrimary: Colors.white,
                              //         shape: RoundedRectangleBorder(
                              //             borderRadius: BorderRadius.circular(30)),
                              //         padding: const EdgeInsets.symmetric(
                              //             horizontal: 50, vertical: 10),
                              //         textStyle: const TextStyle(
                              //             fontSize: 20,
                              //             fontFamily: 'CormorantGaramond'),
                              //       ),
                              //       child: FittedBox(
                              //         child: Obx(
                              //               () => _loginController
                              //               .isLoading.value
                              //               ? Center(
                              //             child: SpinKitThreeBounce(color: Colors.white,),
                              //           )
                              //               : Text(
                              //             'Login',
                              //           ),
                              //         ),
                              //       ),
                              //       onPressed: () {
                              //         _loginController.login();
                              //       },
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(height: ,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an Account? ",
                                    style: AppColors.whiteStyle.copyWith(
                                        fontSize: 18,
                                        color: AppColors.whiteColor
                                            .withOpacity(0.8)),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Get.offNamed('/register');
                                      },
                                      child: Text(
                                        "Register",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: AppColors.primaryColor),
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "or sign-in with",
                    style: AppColors.whiteStyle.copyWith(
                        fontSize: 21,
                        color: AppColors.whiteColor.withOpacity(0.8)),
                  ),
                  Container(
                    height: height * 0.15,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: InkWell(
                            onTap: () {
                              _loginController.signInWithGoogle();
                            },
                            borderRadius: BorderRadius.circular(15),
                            child: SpecialLoginButton(
                              bgColor: Colors.black.withOpacity(0.3),
                              title: "Email",
                              iconW: const Image(
                                height: 70,
                                width: 70,
                                image:
                                    AssetImage("assets/images/email-logo.png"),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: SpecialLoginButton(
                            bgColor: Colors.black.withOpacity(0.3),
                            title: "Facebook",
                            iconW: const Image(
                              height: 70,
                              width: 70,
                              image:
                                  AssetImage("assets/images/facebook-logo.png"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
