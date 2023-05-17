import 'package:b2s/utils/color/colors.dart';
import 'package:flutter/material.dart';

class NoFavouriteListingsFound extends StatelessWidget {
  const NoFavouriteListingsFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            /*const Icon(
              Icons.info_outline,
              color: Color(0XFF6B61AA),
              size: 80,
            ),
            const SizedBox(height: 25.0),*/
            Text(
              'you have no favourite listings'.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: MyColors.txtColor
              ),
            ),
          ],
        ),
      ),
    );
  }
}