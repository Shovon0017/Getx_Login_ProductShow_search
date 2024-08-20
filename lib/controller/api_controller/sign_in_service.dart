import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignInService {
  static Future<String>signIn({required String email, required String password}) async {

    log("Starting......");
    Uri url = Uri.parse("https://cit-ecommerce-codecanyon.bandhantrade.com/api/login");
    var body = {"email_phone":email,
      'password':password};
    var response = await http.post(url, body: body,headers:{
      "Accept":"application/json"
    });
    log("$body");

    log("Status Code:${response.statusCode}  ");

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data["message"]== "Login Successfully!") {
        Get.snackbar("","Login Successful");
      }
      var message = data["message"];
      return message;
    }
    else{
      Get.snackbar("","Login Failed");
    }
    return "Login Failed";
  }
}
