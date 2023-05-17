import 'dart:convert';
import 'package:b2s/models/business_listing_model.dart';
import 'package:b2s/models/favourite_listing_model.dart';
import 'package:b2s/utils/api_services/api_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FavouriteListingController extends GetxController {
  BusinessListingModel businessListingModel = BusinessListingModel();
  final RxList savedListingIds = [].obs;

  Future<FavouriteListingModel> getFavouriteListing(savedKeys) async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // int selectedC = int.parse(localStorage.getString('selectedC').toString());
    // String selectedL = localStorage.getString('selectedL').toString();

    ApiService apiService = ApiService();
    http.Response response = await apiService.getData(
      '/view-saved',
      {'savedKeys': savedKeys, 'country_id': 1},
    );
    print(savedKeys);
    // print(response.body.toString());
    final data = jsonDecode(response.body.toString());

    print("-------- getFavouriteListing --------");
    print(data);
    print("-------- getFavouriteListing --------");

    if (response.statusCode == 200) {
      /// Create a FavouriteListingModel object from the JSON map
      final favListings = FavouriteListingModel.fromJson(data);

      /// Access the 'favListings' property of the CategoryModel object
      // List<Listings> listings = favListings.listings ?? [];
      return favListings;
    } else {
      final favListings = FavouriteListingModel.fromJson(data);
      return favListings;
    }
  }

  addToFavourite(String value) {
    savedListingIds.add(value);
  }

  removeFromFavourite(String value) {
    savedListingIds.remove(value);
  }
}
