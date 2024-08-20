import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/Model/product_model.dart';
import 'package:getx_state_management/controller/api_controller/product.dart';


class HomeController extends GetxController {

  List<Products> finalProductList = [];
  List<Products> productList = [];
  RxList<Product_Model> cardProductList = <Product_Model>[].obs;
  RxBool isLoading = false.obs;
  getProduct() async {
    finalProductList= await ProductApi.productapi();
    isLoading.value = true;
    productList.addAll(finalProductList);
    log("=============finalProductList 1: ${finalProductList.length}");
    log("=============finalProductList 2: ${finalProductList.length}");
    log("=============productList 1: ${productList.length}");
    isLoading.value = false;
  }

  searchFunction({required String searchText}) async {
    isLoading.value = true;
    log("-------------- ${searchText}");
    productList = finalProductList
        .where((value) =>
    value.nameEn!.toLowerCase().contains(searchText.toLowerCase())  ||
        value.regPrice.toString().contains(searchText))
        .toList();
    log("=================Data : ${productList.length}");
    isLoading.value = false;
  }


  addToCartFun({required Product_Model data})async{
    cardProductList.add(data);
  }

  @override
  void onInit() {
    getProduct();

    super.onInit();
  }
}
