import 'dart:convert';

import 'package:b2s/models/listing_detail_model.dart';
import 'package:b2s/utils/api_services/api_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ListingDetailController extends GetxController{
  Future<ListingDetailModel> getListingDetail(int listingId, int countryId, String pageUrl) async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // int selectedC = int.parse(localStorage.getString('selectedC').toString());
    // String selectedL = localStorage.getString('selectedL').toString();
    countryId = 1;
    pageUrl = '/businesses-details/established-fully-promoted-franchise-for-sale-customised-marketin-340697.php';

    ApiService apiService = ApiService();
    http.Response response = await apiService.getData(
      '/getListingDetails',
      {
        'listing_id': listingId,
        'country_id': countryId,
        'pageURL': pageUrl
      },
    );
    print(listingId);
    print(countryId);
    print(pageUrl);
    final data = jsonDecode(response.body.toString());

    print("-------- getListingDetail --------");
    print(data);
    print("-------- getListingDetail --------");

    if (response.statusCode == 200) {
      /// Create a ListingDetailModel object from the JSON map
      final listingName = ListingDetailModel.fromJson(data);
      return listingName;
    } else {
      final listingName = ListingDetailModel.fromJson(data);
      return listingName;
    }
  }

  String removeHtmlTags(String htmlTags){
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlTags.replaceAll(exp, '');
  }
}