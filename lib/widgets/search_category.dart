import 'package:b2s/controllers/search_category_controller.dart';
import 'package:b2s/models/category_model.dart';
import 'package:b2s/utils/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchCategory extends StatelessWidget {
  final bool showLogo;

   SearchCategory({Key? key,
    this.showLogo = true,
  }) : super(key: key);

  final SearchCategoryController searchCategoryCtrl = Get.put(SearchCategoryController());

  // final List<CategoryModel> searchCategory = [];
  // Categories? _selectedCategory;
  // List<String> _suggestions = [];

  void onSuggestionSelected(Categories category) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setString('selectedC', category.catid.toString());
    print('categoryId: ${category.catid}');
    searchCategoryCtrl.txtEditingCtrl.value.text = category.name.toString();
    // searchCategoryCtrl.onSelected(category);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Column(
      children: [
        Container(
          height: height * 0.06,
          // height: 52,
          width: !showLogo ? width * 0.95 : width,
          decoration: BoxDecoration(
            // color: Colors.white.withOpacity(1),
            borderRadius: !showLogo
                ? BorderRadius.circular(50)
                : BorderRadius.circular(8),
          ),
          child:  Obx(
            ()=> TypeAheadField<Categories>(
                suggestionsBoxDecoration: SuggestionsBoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      elevation: 4,
                ),
                noItemsFoundBuilder: (context) => const SizedBox(
                  height: 30,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                    child: Text('No Item Found!', style: TextStyle(
                        fontSize: 16
                    ),),
                  ),
                ),
                textFieldConfiguration: TextFieldConfiguration(
                  focusNode: searchCategoryCtrl.focusNode.value,
                  controller: searchCategoryCtrl.txtEditingCtrl.value,
                  onChanged: (query){
                    if (query.isNotEmpty) {
                      searchCategoryCtrl.getCategories(query);
                    }
                  },
                  textInputAction: TextInputAction.search,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 0),
                    hintText: 'Category like Café, restaurant...',
                    hintStyle: const TextStyle(color: Colors.black87, fontSize: 16),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 3, top: 4, bottom: 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          showLogo
                              ? CircleAvatar(
                                  radius: 23,
                                  backgroundColor: MyColors.txtColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      'assets/images/b2s-icon-small.png',
                                      fit: BoxFit.cover,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : const SizedBox(width: 0, height: 0,),
                          const SizedBox(
                            width: 6,
                          ),
                          const Icon(
                            Boxicons.bx_search,
                            color: Colors.black87,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 5,
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
                suggestionsCallback: (query) async {
                  if (query.isEmpty) {
                    return [];
                  }
                  return await searchCategoryCtrl.getCategories(query);
                },
                itemBuilder: (context, Categories category) {
                  return Padding(
                    padding:  const EdgeInsets.fromLTRB(15, 5, 15, 5),
                    child: Text(
                      category.name.toString(),
                      style: const TextStyle(
                      fontSize: 16,
                      ),
                    ),
                  );
                },
                onSuggestionSelected: onSuggestionSelected,
              ),
          ),


          /*TextFormField(
            controller: searchBarUiCtrl.txtEditingCtrl.value,
            onChanged: (value) {
              searchBarUiCtrl.setTxt(value);
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 0),
              hintText: 'Category like Café, restaurant...',
              hintStyle: const TextStyle(color: Colors.black87, fontSize: 16),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 3, top: 4, bottom: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    widget.showLogo
                        ? CircleAvatar(
                            radius: 23,
                            backgroundColor: MyColors.txtColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/b2s-icon-small.png',
                                fit: BoxFit.cover,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : const SizedBox(),
                    const SizedBox(
                      width: 6,
                    ),
                    const Icon(
                      Boxicons.bx_search,
                      color: Colors.black87,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
              suffixIcon: !widget.showLogo
                  ?  Padding(
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
                borderRadius: !widget.showLogo
                    ? BorderRadius.circular(8)
                    : BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: !widget.showLogo
                    ? BorderRadius.circular(8)
                    : BorderRadius.circular(30),
                borderSide: BorderSide(
                    color: Colors.blue.shade100,
                ),
              ),
            ),
          ),*/

        ),
      ],
    );
  }
}