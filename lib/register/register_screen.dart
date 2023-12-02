import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noor_e_quran/controllers/register_controller.dart';
import 'package:noor_e_quran/constants/colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:noor_e_quran/widgets/round_button.dart';
import 'package:noor_e_quran/widgets/text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterController registerController = RegisterController();
  bool isPassHidden = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: const Icon(
      //       Icons.arrow_back_ios_new_rounded,
      //       color: AppColors.whiteColor,
      //     ),
      //     onPressed: () {
      //       Get.offNamed("/login");
      //     },
      //   ),
      //   // systemOverlayStyle: SystemUiOverlayStyle(
      //   //       statusBarColor: AppColors.primaryColor,
      //   //       systemNavigationBarColor: AppColors.transparent,
      //   //     ),
      //   toolbarHeight: 1,
      //   foregroundColor: AppColors.primaryColor,
      //   shadowColor: AppColors.primaryColor,
      //   surfaceTintColor: AppColors.primaryColor,
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
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                        child: Image(
                          fit: BoxFit.cover,
                          height: 200,
                          width: 200,
                          image: AssetImage("assets/images/Noor_Logo.png"),
                        ),
                      ),
                      SizedBox(
                        height: 30,
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
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ).copyWith(top: height * 0.283),
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                          opacity: 0.02,
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/bg_para.png"),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            spreadRadius: 0.5,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ],
                        color: AppColors.darkBackgroundColor,
                        borderRadius: BorderRadius.circular(20)),
                    height: height * 0.57,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Sign up",
                            style: AppColors.appBarWhiteStyle
                                .copyWith(fontSize: 27),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          // Text("Login to your account\nto connect with Qura'an", style: AppColors.whiteStyle.copyWith(fontSize: 18, color: AppColors.whiteColor.withOpacity(0.8)),),
                          Text(
                            "Enter you details to Sign up!",
                            style: AppColors.whiteStyle.copyWith(
                                fontSize: 19,
                                color: AppColors.whiteColor.withOpacity(0.8)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Form(
                            key: registerController.formKey,
                            child: Column(
                              children: [
                                CustomTextField(
                                  focusedColor: AppColors.primaryColor,
                                  controller:
                                      registerController.usernameController,
                                  inputType: TextInputType.text,
                                  onSave: (value) {
                                    registerController.name = value!;
                                  },
                                  onValidator: (value) {
                                    return null;
                                  },
                                  isAutoCorrect: false,
                                  hint: "Enter username",
                                  obscure: false,
                                  preIcon: Icon(
                                    CupertinoIcons.person_circle_fill,
                                    color:
                                        AppColors.whiteColor.withOpacity(0.3),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomTextField(
                                  focusedColor: AppColors.primaryColor,
                                  inputType: TextInputType.emailAddress,
                                  onValidator: (value) {
                                    return registerController
                                        .validPassword(value);
                                  },
                                  onSave: (value) {
                                    registerController.email = value!;
                                  },
                                  isAutoCorrect: false,
                                  hint: "Enter email Address",
                                  controller:
                                      registerController.emailController,
                                  preIcon: Icon(
                                    EvaIcons.email,
                                    color:
                                        AppColors.whiteColor.withOpacity(0.3),
                                  ),
                                  obscure: false,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomTextField(
                                  focusedColor: AppColors.primaryColor,
                                  inputType: TextInputType.visiblePassword,
                                  onValidator: (value) {
                                    return registerController
                                        .validPassword(value);
                                  },
                                  onSave: (value) {
                                    registerController.password = value!;
                                  },
                                  isAutoCorrect: false,
                                  hint: "Enter your Password",
                                  controller:
                                      registerController.passwordController,
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
                                    child: SizedBox(
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

                          const SizedBox(
                            height: 20,
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
                                  registerController.registeration();
                                },
                                conChild: Obx(
                                  () => registerController.isLoading.value
                                      ? const Center(
                                          child: SpinKitThreeBounce(
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        )
                                      : Center(
                                          child: Text(
                                            'Sign up',
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
                                    "Already have an Account? ",
                                    style: AppColors.whiteStyle.copyWith(
                                        fontSize: 18,
                                        color: AppColors.whiteColor
                                            .withOpacity(0.8)),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Get.offNamed('/login');
                                      },
                                      child: const Text(
                                        "Login",
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
          ],
        ),
      ),
    );
  }
}
