import 'dart:convert';
import 'dart:developer';


import 'package:getx_state_management/Model/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class ProductApi {
  static Future<List<Products>> productapi() async {
    try {
      Response response = await http.get(Uri.parse(
          "https://cit-ecommerce-codecanyon.bandhantrade.com/api/app/v1/products"));
      log("Response: ${response.statusCode}");
      if (response.statusCode == 200) {
        var decodeData = jsonDecode(response.body);
        Product_Model data =Product_Model.fromJson(decodeData);
        log(
            "===================");
        log("${data.products?.length}");
        // if(data.products != null){
        //   return data.products!;
        // }
        return data.products ?? [];
      }
    } catch (e) {
      log("Error: $e");
    }

    return [];
  }
}