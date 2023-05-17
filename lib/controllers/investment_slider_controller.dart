import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvestmentController extends GetxController{
  Rx<RangeValues> rangeValues =   const RangeValues(0.0, 10.0).obs;
  RxDouble startValue = RxDouble(0.0);
  RxDouble endValue = RxDouble(10.0);

  void updateRangeValues(RangeValues values) {
    rangeValues.value = values;
  }

  // var sliderValue = 0.0.obs;
  // var toggle1Value = false.obs;
  // var toggle2Value = false.obs;
  // RangeLabels labels = RangeLabels(values.start.toString(), values.start.toString());

  // void updateSliderValue(double value){
  //   sliderValue.value = value;
  // }
  //
  // void updateToggle1Value(bool value) {
  //   toggle1Value.value = value;
  // }
  //
  // void updateToggle2Value(bool value) {
  //   toggle2Value.value = value;
  // }

}