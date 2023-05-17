import 'dart:convert';
import 'package:b2s/models/business_listing_model.dart';
import 'package:b2s/utils/api_services/api_service.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BusinessListingController extends GetxController {
  final CarouselController carouselController = CarouselController();
  final pageController = PageController();
  final currentIndex = 0.obs;
  Swipe swipe = Swipe.inDecided;
  int currentPage = 0;
  String nextPageNumber = "1";
  List<Listings>? listings;
  final businessListings = <Listings>[].obs;

  Future<BusinessListingModel> getBusinessListings(int selectedC, String selectedL) async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // int selectedC = int.parse(localStorage.getString('selectedC').toString());
    // String selectedL = localStorage.getString('selectedL').toString();

    ApiService apiService = ApiService();
    http.Response response = await apiService.getData(
      '/businesses',
      {
        'selectedC': selectedC,
        'selectedL': selectedL,
        'country_id': 1,
        'page': 1
      },
    );
    // print(selectedC);
    // print(selectedL);
    // print(response.body.toString());
    final data = jsonDecode(response.body.toString());

    print("-------- getBusinessListings --------");
    print(data);
    print("-------- getBusinessListings --------");

    if (response.statusCode == 200) {
      /// Create a CategoryModel object from the JSON map
      final listingName = BusinessListingModel.fromJson(data);
      /// Access the 'listings' property of the CategoryModel object
      // List<Listings> listings = listingName.listings ?? [];
      return listingName;
    } else {
      // handle exceptions
      final listingName = BusinessListingModel.fromJson(data);
      return listingName;
      throw Exception('Failed to fetch listings');
    }
  }


  /*void updateMultiImages(List<MultiImages> newImages) {
    // Get the current listings
    final listings = businessListings.toList();

    // Update the `multiImages` of the current listing with the new set of images
    final currentListing = listings[currentIndex.value];
    currentListing.multiImages = newImages;

    // Update the `businessListings` observable with the updated listings
    businessListings.value = listings;
  }*/

  void updateListingImages(Listings listing, List<MultiImages> newImages) {
    listing.multiImages = newImages;
  }

  void setCurrentIndex(int index) {
    currentIndex.value = index;
  }

  void like() {
    if (swipe == Swipe.inDecided) {
      swipe = Swipe.like;
    }
  }

  void nope() {
    if (swipe == Swipe.inDecided) {
      swipe = Swipe.nope;
    }
  }

  void superLike() {
    if (swipe == Swipe.inDecided) {
      swipe = Swipe.superLike;
    }
  }

  void reset() {
    if (swipe != Swipe.inDecided) {
      swipe = Swipe.inDecided;
    }
  }
}

enum Swipe {
  inDecided,
  nope,
  like,
  superLike,
}
