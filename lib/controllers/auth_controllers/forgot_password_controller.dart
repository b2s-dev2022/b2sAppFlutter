import 'dart:convert';

import 'package:b2s/utils/api_services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordController extends GetxController{
  final emailCtrl = TextEditingController().obs;

  Future<dynamic> forgotPassword(email, countryId) async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // int selectedC = int.parse(localStorage.getString('selectedC').toString());
    // String selectedL = localStorage.getString('selectedL').toString();
    countryId = 1;
    ApiService apiService = ApiService();
    http.Response response = await apiService.getData(
      '/forgot-password',
      {'email': email, 'country_id': countryId},
    );
    print(email);
    print(countryId);
    // print(response.body.toString());
    final data = jsonDecode(response.body.toString());

    print("-------- forgotPassword --------");
    print(data);
    print("-------- forgotPassword --------");

    if (response.statusCode == 200) {
      /// Create a CategoryModel object from the JSON map
      //final loginDate = LoginModel.fromJson(data)
      return data;
      /// Access the 'listings' property of the CategoryModel object
      // List<Listings> listings = listingName.listings ?? [];
      // return loginDate;
    } else {
      return data;
    }
  }
}