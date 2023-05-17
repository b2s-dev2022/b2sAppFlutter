import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class DetailSliderController extends GetxController{
  final CarouselController carouselController = CarouselController();
  final _currentSlidIndex = 0.obs;
  int get currentSlideIndex => _currentSlidIndex.value;
  set currentSlideIndex(int val) => _currentSlidIndex.value = val;
}