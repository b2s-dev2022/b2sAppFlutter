import 'package:b2s/utils/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BrokerRegistrationForm extends StatelessWidget {
  const BrokerRegistrationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Container(
            height: 52,
            // width: MediaQuery.of(context).size.width - 0,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              // textAlign: TextAlign.center,
              // controller: bottomSheetCtrl.nameCtrl,
              onChanged: (value) {
                // searchBarUiCtrl.setTxt(value);
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 0),
                hintText: 'Company Name',
                hintStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 4, bottom: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: MyColors.txtColor,
                        child: Transform.scale(
                          scale: 0.9,
                          child: SvgPicture.asset(
                            'assets/icons/Group 85.svg',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue.shade100),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.blue.shade100),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 52,
            // width: MediaQuery.of(context).size.width - 0,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              // textAlign: TextAlign.center,
              // controller: bottomSheetCtrl.nameCtrl,
              onChanged: (value) {
                // searchBarUiCtrl.setTxt(value);
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 0),
                hintText: 'Your Name',
                hintStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 4, bottom: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: MyColors.txtColor,
                        child: Transform.scale(
                          scale: 0.9,
                          child: SvgPicture.asset(
                            'assets/icons/Group 85.svg',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue.shade100),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.blue.shade100),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 52,
            // width: MediaQuery.of(context).size.width - 0,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              // textAlign: TextAlign.center,
              // controller: bottomSheetCtrl.nameCtrl,
              onChanged: (value) {
                // searchBarUiCtrl.setTxt(value);
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 0),
                hintText: 'Your Email',
                hintStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 4, bottom: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: MyColors.txtColor,
                        child: Transform.scale(
                          scale: 0.9,
                          child: SvgPicture.asset(
                            'assets/icons/Group 87.svg',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue.shade100),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.blue.shade100),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 52,
            // width: MediaQuery.of(context).size.width - 0,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              // textAlign: TextAlign.center,
              // controller: bottomSheetCtrl.nameCtrl,
              onChanged: (value) {
                // searchBarUiCtrl.setTxt(value);
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 0),
                hintText: 'Street',
                hintStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 4, bottom: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: MyColors.txtColor,
                        child: Transform.scale(
                            scale: 0.9,
                            child: const Icon(
                              Boxicons.bx_street_view,
                              size: 20,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue.shade100),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.blue.shade100),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 52,
            // width: MediaQuery.of(context).size.width - 0,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              // textAlign: TextAlign.center,
              // controller: bottomSheetCtrl.nameCtrl,
              onChanged: (value) {
                // searchBarUiCtrl.setTxt(value);
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 0),
                hintText: 'City',
                hintStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 4, bottom: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: MyColors.txtColor,
                        child: Transform.scale(
                            scale: 0.9,
                            child: const Icon(
                              Boxicons.bx_buildings,
                              size: 20,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue.shade100),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.blue.shade100),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 52,
            // width: MediaQuery.of(context).size.width - 0,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              // textAlign: TextAlign.center,
              // controller: bottomSheetCtrl.nameCtrl,
              onChanged: (value) {
                // searchBarUiCtrl.setTxt(value);
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 0),
                hintText: 'State',
                hintStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 4, bottom: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // CircleAvatar(
                      //   radius: 15,
                      //   backgroundColor: MyColors.txtColor,
                      //   child: Transform.scale(
                      //       scale: 0.9,
                      //       child: const Icon(
                      //         Boxicons.bx_plus,
                      //         size: 20,
                      //         color: Colors.white,
                      //       )),
                      // ),
                    ],
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue.shade100),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.blue.shade100),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 52,
            // width: MediaQuery.of(context).size.width - 0,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              // textAlign: TextAlign.center,
              // controller: bottomSheetCtrl.nameCtrl,
              onChanged: (value) {
                // searchBarUiCtrl.setTxt(value);
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 0),
                hintText: 'Post/Zip Code',
                hintStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 4, bottom: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: MyColors.txtColor,
                        child: Transform.scale(
                            scale: 0.9,
                            child: const Icon(
                              Boxicons.bx_envelope,
                              size: 20,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue.shade100),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.blue.shade100),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 52,
            // width: MediaQuery.of(context).size.width - 0,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              // textAlign: TextAlign.center,
              // controller: bottomSheetCtrl.nameCtrl,
              onChanged: (value) {
                // searchBarUiCtrl.setTxt(value);
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 0),
                hintText: 'Phone No',
                hintStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 4, bottom: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: MyColors.txtColor,
                        child: Transform.scale(
                            scale: 0.9,
                            child: const Icon(
                              Boxicons.bxs_phone_call,
                              size: 20,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue.shade100),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.blue.shade100),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 52,
            // width: MediaQuery.of(context).size.width - 0,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              // textAlign: TextAlign.center,
              // controller: bottomSheetCtrl.nameCtrl,
              onChanged: (value) {
                // searchBarUiCtrl.setTxt(value);
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 0),
                hintText: 'Mobile No',
                hintStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 4, bottom: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: MyColors.txtColor,
                        child: Transform.scale(
                            scale: 0.9,
                            child: const Icon(
                              Boxicons.bxs_phone_call,
                              size: 20,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue.shade100),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.blue.shade100),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 52,
            // width: MediaQuery.of(context).size.width - 0,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              // textAlign: TextAlign.center,
              // controller: bottomSheetCtrl.nameCtrl,
              onChanged: (value) {
                // searchBarUiCtrl.setTxt(value);
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 0),
                hintText: 'Username',
                hintStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 4, bottom: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: MyColors.txtColor,
                        child: Transform.scale(
                          scale: 0.9,
                          child: SvgPicture.asset(
                            'assets/icons/Group 85.svg',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue.shade100),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.blue.shade100),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 52,
            // width: MediaQuery.of(context).size.width - 0,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              // textAlign: TextAlign.center,
              // controller: bottomSheetCtrl.nameCtrl,
              onChanged: (value) {
                // searchBarUiCtrl.setTxt(value);
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 0),
                hintText: 'Password',
                hintStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 4, bottom: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: MyColors.txtColor,
                        child: Transform.scale(
                            scale: 0.9,
                            child: const Icon(
                              Boxicons.bx_lock,
                              size: 20,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue.shade100),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.blue.shade100),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 52,
            // width: MediaQuery.of(context).size.width - 0,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              // textAlign: TextAlign.center,
              // controller: bottomSheetCtrl.nameCtrl,
              onChanged: (value) {
                // searchBarUiCtrl.setTxt(value);
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 0),
                hintText: 'Retype Password',
                hintStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 4, bottom: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: MyColors.txtColor,
                        child: Transform.scale(
                            scale: 0.9,
                            child: const Icon(
                              Boxicons.bx_lock,
                              size: 20,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue.shade100),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.blue.shade100),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
