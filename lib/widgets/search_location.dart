import 'package:b2s/controllers/search_category_controller.dart';
import 'package:b2s/controllers/search_location_controller.dart';
import 'package:b2s/models/category_model.dart';
import 'package:b2s/models/location_model.dart';
import 'package:b2s/utils/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchLocation extends StatelessWidget {
  final bool showLogo;

  SearchLocation({Key? key,
    this.showLogo = true,
  }) : super(key: key);

  final SearchLocationController searchLocationCtrl = Get.put(SearchLocationController());

  // List<LocationModel> locationList = [];

  void onSuggestionSelected(Locations locations) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setString('selectedL', locations.locid.toString());
    print('locationId: ${locations.locid}');
    searchLocationCtrl.txtEditingCtrl.value.text = locations.name.toString();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Container(
      height: height * 0.06,
      width: showLogo ? width * 0.7 : width,
      decoration: BoxDecoration(
        // color: Colors.white.withOpacity(1),
        borderRadius: !showLogo
            ? BorderRadius.circular(50)
            : BorderRadius.circular(8),
      ),
      child: Obx(
        ()=> TypeAheadField<Locations>(
          suggestionsBoxDecoration: SuggestionsBoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            elevation: 4,
          ),
          noItemsFoundBuilder: (context) => const SizedBox(
            height: 30,
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Text(
                'No Item Found!',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          textFieldConfiguration: TextFieldConfiguration(
            focusNode: searchLocationCtrl.focusNode.value,
            controller: searchLocationCtrl.txtEditingCtrl.value,
            onChanged: (query) {
              if (query.isNotEmpty) {
                searchLocationCtrl.getLocation(query);
              }
            },
            textInputAction: TextInputAction.search,
            textCapitalization: TextCapitalization.words,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 0),
              hintText: showLogo ? 'Location like Sydney, NSW...' : 'Melbourne, VIC',
              hintStyle: const TextStyle(
                color: Colors.black87,
                fontSize: 15,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 5, top: 4, bottom: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    showLogo ? const Icon(
                      Icons.location_on_outlined,
                      color: Colors.black87,
                      size: 18,
                    ) : const Icon(
                      Icons.search_outlined,
                      color: Colors.black87,
                      size: 18,
                    ),
                  ],
                ),
              ),
              suffixIcon: !showLogo
                  ? Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Transform.scale(
                        alignment: Alignment.centerRight,
                        scale: 0.25,
                        child: SvgPicture.asset(
                          'assets/icons/filter.svg',
                        ),
                      ),
                    )
                  : null,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blue.shade100,
                ),
                borderRadius: !showLogo
                    ? BorderRadius.circular(8)
                    : BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: !showLogo
                    ? BorderRadius.circular(8)
                    : BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Colors.blue.shade100,
                ),
              ),
            ),
          ),
          suggestionsCallback: (value) async {
            if (value.isEmpty) {
              return [];
            }
            return await searchLocationCtrl.getLocation(value);
          },
          itemBuilder: (context, Locations locations) {
            return Padding(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Text(
                locations.name.toString(),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            );
          },
          onSuggestionSelected: onSuggestionSelected,
        ),
      ),
    );
  }
}
