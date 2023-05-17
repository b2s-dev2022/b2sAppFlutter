import 'dart:convert';
import 'package:b2s/models/login_model.dart';
import 'package:b2s/utils/api_services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:platform_device_id/platform_device_id.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final emailCtrl = TextEditingController().obs;
  final passwordCtrl = TextEditingController().obs;
  final verificationCodeCtrl = TextEditingController().obs;
  final isChecked = false.obs;

  Future<LoginModel> buyersLogin(email, password) async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // int selectedC = int.parse(localStorage.getString('selectedC').toString());
    // String selectedL = localStorage.getString('selectedL').toString();

    ApiService apiService = ApiService();
    http.Response response = await apiService.getData(
      '/buyers-login',
      {'email': email, 'password': password},
    );
    print(email);
    print(password);
    // print(response.body.toString());
    final data = jsonDecode(response.body.toString());

    print("-------- buyersLogin --------");
    print(data);
    print(data["AuthenticatedBuyer"]);
    print("-------- buyersLogin --------");

    if (response.statusCode == 200) {
      /// Create a CategoryModel object from the JSON map
      final loginDate = LoginModel.fromJson(data);
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString(
          'buyerInfo', data["AuthenticatedBuyer"].toString());

      /// Access the 'listings' property of the CategoryModel object
      // List<Listings> listings = listingName.listings ?? [];
      return loginDate;
    } else {
      // handle exceptions
      final loginDate = LoginModel.fromJson(data);
      return loginDate;
      throw Exception('Failed to fetch listings');
    }
  }

  Future<dynamic> getDeviceId() async {
    return await PlatformDeviceId.getDeviceId;
  }

  @override
  void dispose() {
    emailCtrl.value.dispose();
    passwordCtrl.value.dispose();
    super.dispose();
  }
}
