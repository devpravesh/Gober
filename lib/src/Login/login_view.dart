import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../Utils/DarkThemeProvider.dart';
import '../Utils/app_colors.dart';
import '../Utils/button_them.dart';
import '../Utils/responsive.dart';
import '../constant/show_toast_dialog.dart';
import '../sample_feature/sample_item_list_view.dart';
import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = "/login";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: "login_image",
              child: Image.asset("assets/images/login_image.png",
                  width: Responsive.width(100, context)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text("Login",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600, fontSize: 18)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text("Welcome Back! We are happy to have \nyou back",
                        style:
                            GoogleFonts.poppins(fontWeight: FontWeight.w400)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      validator: (value) =>
                          value != null && value.isNotEmpty ? null : 'Required',
                      keyboardType: TextInputType.number,
                      textCapitalization: TextCapitalization.sentences,
                      // controller: controller.phoneNumberController.value,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          color: themeChange.getThem()
                              ? Colors.white
                              : Colors.black),
                      decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          fillColor: themeChange.getThem()
                              ? AppColors.darkTextField
                              : AppColors.textField,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 12),
                          prefixIcon: CountryCodePicker(
                              onChanged: (value) {
                                print(value);
                                // controller.countryCode.value =
                                //     value.dialCode.toString();
                              },
                              dialogBackgroundColor: themeChange.getThem()
                                  ? AppColors.darkBackground
                                  : AppColors.background,
                              initialSelection: "+91",
                              comparator: (a, b) =>
                                  b.name!.compareTo(a.name.toString()),
                              flagDecoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2)),
                              )),
                          disabledBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                                color: themeChange.getThem()
                                    ? AppColors.darkTextFieldBorder
                                    : AppColors.textFieldBorder,
                                width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                                color: themeChange.getThem()
                                    ? AppColors.darkTextFieldBorder
                                    : AppColors.textFieldBorder,
                                width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                                color: themeChange.getThem()
                                    ? AppColors.darkTextFieldBorder
                                    : AppColors.textFieldBorder,
                                width: 1),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                                color: themeChange.getThem()
                                    ? AppColors.darkTextFieldBorder
                                    : AppColors.textFieldBorder,
                                width: 1),
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                                color: themeChange.getThem()
                                    ? AppColors.darkTextFieldBorder
                                    : AppColors.textFieldBorder,
                                width: 1),
                          ),
                          hintText: "Phone number")),
                  const SizedBox(
                    height: 30,
                  ),
                  ButtonThem.buildButton(
                    context,
                    title: "Next",
                    onPress: () {
                      // controller.sendCode();
                      Navigator.pushNamed(context, OtpScreen.routeName);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 40),
                    child: Row(
                      children: [
                        const Expanded(
                            child: Divider(
                          height: 1,
                        )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "OR",
                            style: GoogleFonts.poppins(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                        const Expanded(
                            child: Divider(
                          height: 1,
                        )),
                      ],
                    ),
                  ),
                  ButtonThem.buildBorderButton(
                    context,
                    title: "Login with google",
                    iconVisibility: true,
                    iconAssetImage: 'assets/icons/ic_google.png',
                    onPress: () async {
                      ShowToastDialog.showLoader("Please wait");
                      // await controller.signInWithGoogle().then((value) {
                      //   ShowToastDialog.closeLoader();
                      //   if (value != null) {
                      //     if (value.additionalUserInfo!.isNewUser) {
                      //       print("----->new user");
                      //       UserModel userModel = UserModel();
                      //       userModel.id = value.user!.uid;
                      //       userModel.email = value.user!.email;
                      //       userModel.fullName = value.user!.displayName;
                      //       userModel.profilePic = value.user!.photoURL;
                      //       userModel.loginType = Constant.googleLoginType;

                      //       ShowToastDialog.closeLoader();
                      //       Get.to(const InformationScreen(), arguments: {
                      //         "userModel": userModel,
                      //       });
                      //     } else {
                      //       print("----->old user");
                      //       FireStoreUtils.userExitOrNot(value.user!.uid)
                      //           .then((userExit) async {
                      //         ShowToastDialog.closeLoader();
                      //         if (userExit == true) {
                      //           UserModel? userModel =
                      //               await FireStoreUtils.getUserProfile(
                      //                   value.user!.uid);
                      //           if (userModel != null) {
                      //             if (userModel.isActive == true) {
                      //               Get.offAll(const DashBoardScreen());
                      //             } else {
                      //               await FirebaseAuth.instance.signOut();
                      //               ShowToastDialog.showToast(
                      //                   "This user is disable please contact administrator");
                      //             }
                      //           }
                      //         } else {
                      //           UserModel userModel = UserModel();
                      //           userModel.id = value.user!.uid;
                      //           userModel.email = value.user!.email;
                      //           userModel.fullName = value.user!.displayName;
                      //           userModel.profilePic = value.user!.photoURL;
                      //           userModel.loginType = Constant.googleLoginType;

                      //           Get.to(const InformationScreen(), arguments: {
                      //             "userModel": userModel,
                      //           });
                      //         }
                      //       });
                      //     }
                      //   }
                      // });
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Visibility(
                      visible: Platform.isIOS,
                      child: ButtonThem.buildBorderButton(
                        context,
                        title: "Login with apple",
                        iconVisibility: true,
                        iconAssetImage: 'assets/icons/ic_apple.png',
                        onPress: () async {
                          ShowToastDialog.showLoader("Please wait");
                          Future.delayed(const Duration(seconds: 3))
                              .then((value) {
                            ShowToastDialog.closeLoader();
                          });
                          // await controller.signInWithApple().then((value) {
                          // ShowToastDialog.closeLoader();
                          //   if (value != null) {
                          //     if (value.additionalUserInfo!.isNewUser) {
                          //       log("----->new user");
                          //       UserModel userModel = UserModel();
                          //       userModel.id = value.user!.uid;
                          //       userModel.email = value.user!.email;
                          //       userModel.profilePic = value.user!.photoURL;
                          //       userModel.loginType = Constant.appleLoginType;

                          //       ShowToastDialog.closeLoader();
                          //       Get.to(const InformationScreen(), arguments: {
                          //         "userModel": userModel,
                          //       });
                          //     } else {
                          //       print("----->old user");
                          //       FireStoreUtils.userExitOrNot(value.user!.uid)
                          //           .then((userExit) async {
                          //         ShowToastDialog.closeLoader();

                          //         if (userExit == true) {
                          //           UserModel? userModel =
                          //               await FireStoreUtils.getUserProfile(
                          //                   value.user!.uid);
                          //           if (userModel != null) {
                          //             if (userModel.isActive == true) {
                          //               Get.offAll(const DashBoardScreen());
                          //             } else {
                          //               await FirebaseAuth.instance.signOut();
                          //               ShowToastDialog.showToast(
                          //                   "This user is disable please contact administrator");
                          //             }
                          //           }
                          //         } else {
                          //           UserModel userModel = UserModel();
                          //           userModel.id = value.user!.uid;
                          //           userModel.email = value.user!.email;
                          //           userModel.profilePic = value.user!.photoURL;
                          //           userModel.loginType =
                          //               Constant.googleLoginType;

                          //           Get.to(const InformationScreen(),
                          //               arguments: {
                          //                 "userModel": userModel,
                          //               });
                          //         }
                          //       });
                          //     }
                          //   }
                          // });
                        },
                      )),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: SafeArea(
            child: Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                text: 'By tapping "Next" you agree to ',
                style: GoogleFonts.poppins(),
                children: <TextSpan>[
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(
                              context, SampleItemListView.routeName);
                          // Get.to(const TermsAndConditionScreen(
                          //   type: "terms",
                          // ));
                        },
                      text: 'Terms and conditions',
                      style: GoogleFonts.poppins(
                          decoration: TextDecoration.underline)),
                  TextSpan(text: ' and ', style: GoogleFonts.poppins()),
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Get.to(const TermsAndConditionScreen(
                          //   type: "privacy",
                          // ));
                        },
                      text: 'privacy policy',
                      style: GoogleFonts.poppins(
                          decoration: TextDecoration.underline)),
                  // can add more TextSpans here...
                ],
              ),
            ),
          )),
    );
  }
}
