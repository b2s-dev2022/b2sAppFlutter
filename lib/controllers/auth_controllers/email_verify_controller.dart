import 'dart:convert';

import 'package:b2s/utils/api_services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EmailVerifyController extends GetxController {
  final otpController1 = TextEditingController().obs;
  final otpController2 = TextEditingController().obs;
  final otpController3 = TextEditingController().obs;
  final otpController4 = TextEditingController().obs;
  final focusNode1 = FocusNode().obs;
  final focusNode2 = FocusNode().obs;
  final focusNode3 = FocusNode().obs;
  final focusNode4 = FocusNode().obs;
  String otpErrorMessage = '';

  @override
  void dispose() {
    otpController1.value.dispose();
    otpController2.value.dispose();
    otpController3.value.dispose();
    otpController4.value.dispose();
    focusNode1.value.dispose();
    focusNode2.value.dispose();
    focusNode3.value.dispose();
    focusNode4.value.dispose();
    super.dispose();
  }

  Future<dynamic> verifyEmail(email) async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // int selectedC = int.parse(localStorage.getString('selectedC').toString());
    // String selectedL = localStorage.getString('selectedL').toString();

    ApiService apiService = ApiService();
    http.Response response = await apiService.getData(
      '/forgot-password',
      {'email': email},
    );
    print(email);
    // print(response.body.toString());
    final data = jsonDecode(response.body.toString());

    print("-------- verifyEmail --------");
    print(data);
    print("-------- verifyEmail --------");

    if (response.statusCode == 200) {
      /// Create a CategoryModel object from the JSON map
      // final loginDate = LoginModel.fromJson(data);

      /// Access the 'listings' property of the CategoryModel object
      // List<Listings> listings = listingName.listings ?? [];
      // return loginDate;
      return data;
    } else {
      return data;
    }
  }
}
