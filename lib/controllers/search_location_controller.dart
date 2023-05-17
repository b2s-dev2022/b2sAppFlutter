import 'dart:convert';
import 'package:b2s/models/location_model.dart';
import 'package:b2s/utils/api_services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SearchLocationController extends GetxController {
  final txtEditingCtrl = TextEditingController().obs;
  final focusNode = FocusNode().obs;

  @override
  void dispose() {
    // Dispose of the controllers when the controller is closed
    txtEditingCtrl.value.dispose();
    focusNode.value.dispose();
    super.dispose();
  }

  Future<List<Locations>> getLocation(String query) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    int countryId = 1;
    // print('countryId: $countryId');
    ApiService apiService = ApiService();
    http.Response response = await apiService.getData('/typeHint/location',
        {
          'country_id': countryId,
          'term': query
        });
    // print('res: $response');
    print(response.statusCode);
    final data = await jsonDecode(response.body.toString());
    print('decodedData: $data');
    print("-------- getLocation --------");
    print(data);
    print("-------- getLocation --------");

    if (response.statusCode == 200) {
      // final List<Map<String, dynamic>> allLocations = (decodedData['locations']);
      // final List<Map<String, dynamic>> matchingLocations = allLocations.where((category) =>
      //     category['name'].toString().toLowerCase().contains(query.toLowerCase())).toList();
      //
      // return matchingLocations;
      /// Create a CategoryModel object from the JSON map
      final locationName = LocationModel.fromJson(data);

      /// Access the 'categories' property of the CategoryModel object
      List<Locations> locations = locationName.locations ?? [];

      /// Filter categories based on name
      locations = locations
          .where((location) =>
              location.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();
      // locations = locations.where((location) => location.name!.toLowerCase() == query.toLowerCase()).toList();
      return locations;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
