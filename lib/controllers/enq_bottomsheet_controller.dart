import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnquiryBottomSheetController extends GetxController {
  final nameCtrl = TextEditingController().obs;
  final emailCtrl = TextEditingController().obs;
  final phoneCtrl = TextEditingController().obs;
  final contactCtrl = TextEditingController().obs;
  final commentCtrl = TextEditingController().obs;
}