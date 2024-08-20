import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/controller/api_controller/sign_in_service.dart';
import 'package:getx_state_management/controller/getx_controller/sign_in.dart';
import 'package:getx_state_management/view/common_widgets/common_button.dart';
import 'package:getx_state_management/view/common_widgets/common_loading_button.dart';
import 'package:getx_state_management/view/screen/auth/sign_in/widget/email_text_field.dart';
import 'package:getx_state_management/view/screen/auth/sign_in/widget/password_text_field.dart';
import 'package:http/http.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    SignInService signInService=Get.put(SignInService());
    SignInController signInController = Get.put(SignInController());
    return Scaffold(resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: signInController.formKey,
              child: Column(
                children: [
                  buildSizedBox(height: 200),
                  EmailTextField(
                    mailController: signInController.mailController,
                  ),
                  buildSizedBox(height: 10),
                  PasswordTextField(
                    passController: signInController.passwordController,
                  ),
                  buildSizedBox(height: 10),

                  Obx(()=> signInController.isLoading.isFalse ?  CommonButton(
                      buttonName: "Sign In",
                      onTap: () {
                        if (!signInController.formKey.currentState!.validate()) {
                          return ;
                        }
                        log("==========222222222222===============");
                        signInController.signInFun();
                      }) : const CommonLoadingButton()),

                  //
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBox({double? height, double? width}) =>
      SizedBox(height: height, width: width);
}
