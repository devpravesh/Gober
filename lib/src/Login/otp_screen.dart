import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_detect_app/src/Utils/DarkThemeProvider.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../Utils/app_colors.dart';
import '../Utils/button_them.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);
  static const String routeName = "/otp_screen";
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
                child: Image.asset("assets/images/login_image.png")),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text("Verify Phone Number",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600, fontSize: 18)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text("We just send a verification code to ",
                        style: GoogleFonts.poppins()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: PinCodeTextField(
                      length: 6,
                      appContext: context,
                      keyboardType: TextInputType.phone,
                      pinTheme: PinTheme(
                        fieldHeight: 50,
                        fieldWidth: 50,
                        activeColor: themeChange.getThem()
                            ? AppColors.darkTextFieldBorder
                            : AppColors.textFieldBorder,
                        selectedColor: themeChange.getThem()
                            ? AppColors.darkTextFieldBorder
                            : AppColors.textFieldBorder,
                        inactiveColor: themeChange.getThem()
                            ? AppColors.darkTextFieldBorder
                            : AppColors.textFieldBorder,
                        activeFillColor: themeChange.getThem()
                            ? AppColors.darkTextField
                            : AppColors.textField,
                        inactiveFillColor: themeChange.getThem()
                            ? AppColors.darkTextField
                            : AppColors.textField,
                        selectedFillColor: themeChange.getThem()
                            ? AppColors.darkTextField
                            : AppColors.textField,
                        // shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enableActiveFill: true,
                      cursorColor: AppColors.primary,
                      // controller: controller.otpController.value,
                      onCompleted: (v) async {},
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ButtonThem.buildButton(
                    context,
                    title: "Verify",
                    onPress: () async {
                      // if (controller.otpController.value.text.length ==
                      //     6) {
                      //   ShowToastDialog.showLoader("Verify OTP");

                      //   PhoneAuthCredential credential =
                      //       PhoneAuthProvider.credential(
                      //           verificationId:
                      //               controller.verificationId.value,
                      //           smsCode:
                      //               controller.otpController.value.text);
                      //   await FirebaseAuth.instance
                      //       .signInWithCredential(credential)
                      //       .then((value) async {
                      //     if (value.additionalUserInfo!.isNewUser) {
                      //       print("----->new user");
                      //       UserModel userModel = UserModel();
                      //       userModel.id = value.user!.uid;
                      //       userModel.countryCode =
                      //           controller.countryCode.value;
                      //       userModel.phoneNumber =
                      //           controller.phoneNumber.value;
                      //       userModel.loginType = Constant.phoneLoginType;

                      //       ShowToastDialog.closeLoader();
                      //       Get.to(const InformationScreen(), arguments: {
                      //         "userModel": userModel,
                      //       });
                      //
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
                      //                   "This user is disable please contact administrator"
                      //                       );
                      //             }
                      //           }
                      //         } else {
                      //           UserModel userModel = UserModel();
                      //           userModel.id = value.user!.uid;
                      //           userModel.countryCode =
                      //               controller.countryCode.value;
                      //           userModel.phoneNumber =
                      //               controller.phoneNumber.value;
                      //           userModel.loginType =
                      //               Constant.phoneLoginType;

                      //           Get.to(const InformationScreen(),
                      //               arguments: {
                      //                 "userModel": userModel,
                      //               });
                      //         }
                      //       });
                      //     }
                      //   }).catchError((error) {
                      //     ShowToastDialog.closeLoader();
                      //     ShowToastDialog.showToast("Code is Invalid");
                      //   });
                      // } else {
                      //   ShowToastDialog.showToast(
                      //       "Please Enter Valid OTP");
                      // }

                      // print(controller.countryCode.value);
                      // print(controller.phoneNumberController.value.text);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
