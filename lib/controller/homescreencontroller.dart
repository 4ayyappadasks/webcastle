import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:webcastle/core/color.dart';
import 'package:webcastle/model/homescreenmodel.dart';
import 'package:webcastle/model/loginmodel.dart';

import '../model/wishlistmodel.dart';

class HomeController extends GetxController {
  final dio = Dio();

  RxBool loginloading = false.obs;
  RxBool loginerror = false.obs;
  Loginmodel? loginmodel;

  Homemodel? homemodel;
  RxBool homedataloading = false.obs;
  RxBool homedataerror = false.obs;

  intialloginfunction() async {
    try {
      loginloading.value = true;
      loginerror.value = false;
      var response = await dio.post(
        "https://s419.previewbay.com/fragrance-b2b-backend/api/v1/anonymous-login",
        queryParameters: {
          "device_token": "test_token",
          "device_type": "1",
        },
      );
      log("response : ${response.data}");
      if (response.statusCode == 200) {
        loginloading.value = false;
        loginmodel = Loginmodel.fromJson(response.data);
        if (loginmodel!.data.accessToken.isNotEmpty) {
          homedatafunction(token: "${loginmodel?.data.accessToken}");
        } else {
          debugLog("access token was empty or error occur");
        }
      } else {
        loginloading.value = false;
        loginerror.value = true;
      }
    } catch (e) {
      loginloading.value = false;
      loginerror.value = true;
      debugLog("error in initial login : $e");
    }
  }

  homedatafunction({required String token}) async {
    try {
      homedataloading.value = true;
      homedataerror.value = false;
      var homeresponse = await dio.get(
        "https://s419.previewbay.com/fragrance-b2b-backend/api/v1/home",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      log("response in home : ${homeresponse.data} , with token : $token");
      if (homeresponse.statusCode == 200) {
        homedataloading.value = false;
        homedataerror.value = false;
        homemodel = Homemodel.fromJson(homeresponse.data);
      } else {
        homedataloading.value = false;
        homedataerror.value = true;
      }
    } catch (e) {
      debugLog("error in home response : $e");
      homedataloading.value = false;
      homedataerror.value = true;
    }
  }

  void debugLog(Object? object) {
    if (kDebugMode) {
      print(object);
    }
  }

  @override
  void onInit() {
    intialloginfunction();
    super.onInit();
  }

//   // //wishlist
//   RxList<WishlistItem> wishlistlist = <WishlistItem>[].obs;
//
//   //
//   void AddtoWishlistFromHomeData({
//     required String productname,
//     required int productid,
//     required int productcount,
//   }) {
//     wishlistlist.add(WishlistItem(productName: productname, productid: productid,));
//   }
//   // Increase count by product id
//   void increaseWishlistCount(int productid) {
//     final item = wishlistlist.firstWhereOrNull((e) => e.productid == productid);
//     if (item != null) {
//       item.count.value++;
//     }
//   }
//
// // Decrease count by product id
//   void decreaseWishlistCount(int productid) {
//     final item = wishlistlist.firstWhereOrNull((e) => e.productid == productid);
//     if (item != null && item.count.value > 0) {
//       item.count.value--;
//     }
//   }

tostmsgfun({required String msg}){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: ColorState.textblackcolor,
      textColor: ColorState.textwhitecolor,
      fontSize: 16.0
  );
}

}
