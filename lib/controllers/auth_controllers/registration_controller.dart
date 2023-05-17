import 'dart:convert';

import 'package:b2s/models/login_model.dart';
import 'package:b2s/utils/api_services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BuyerRegistrationController extends GetxController {
  final emailCtrl = TextEditingController().obs;
  final nameCtrl = TextEditingController().obs;
  final phoneCtrl = TextEditingController().obs;
  final passwordCtrl = TextEditingController().obs;
  final confirmPasswordCtrl = TextEditingController().obs;
  final codeCtrl = TextEditingController().obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final isChecked = false.obs;
  var isPasswordHidden = true.obs;
  var isConfirmPasswordHidden = true.obs;

  Future<dynamic> buyerRegistration(
      email, name, phone, password, confirmPassword,
      {code}) async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // int selectedC = int.parse(localStorage.getString('selectedC').toString());
    // String selectedL = localStorage.getString('selectedL').toString();

    ApiService apiService = ApiService();
    http.Response response = await apiService.getData(
      '/buyer-registration',
      {
        'email': email,
        'name': name,
        'phone': phone,
        'password': password,
        'confirm_password': confirmPassword,
        'code': code,
      },
    );
    print(email);
    print(name);
    print(phone);
    print(password);
    print(confirmPassword);
    print(code);
    final data = jsonDecode(response.body.toString());

    print("-------- buyerRegistration --------");
    print(data);
    print("-------- buyerRegistration --------");

    if (response.statusCode == 200) {
      if (data["status"] != false) {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('buyerInfo', data["AuthenticatedBuyer"]);
      }
    } else {
      return data;
    }
  }

  @override
  void dispose() {
    emailCtrl.value.dispose();
    nameCtrl.value.dispose();
    phoneCtrl.value.dispose();
    passwordCtrl.value.dispose();
    confirmPasswordCtrl.value.dispose();
    codeCtrl.value.dispose();
    super.dispose();
  }
}
