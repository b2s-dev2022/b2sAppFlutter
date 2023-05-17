import 'package:b2s/bindings/bottom_bar_items_binding.dart';
import 'package:b2s/screens/auth/buyer_registration_screen.dart';
import 'package:b2s/screens/auth/forgot_password_screen.dart';
import 'package:b2s/screens/auth/login_progress_screen.dart';
import 'package:b2s/screens/auth/private_seller_registration_screen.dart';
import 'package:b2s/screens/auth/reset_password_screen.dart';
import 'package:b2s/screens/auth/verify_email_screen.dart';
import 'package:b2s/screens/broker_products_screen.dart';
import 'package:b2s/screens/business_broker_detail_screen.dart';
import 'package:b2s/screens/business_broker_screen.dart';
import 'package:b2s/screens/business_listing_screen.dart';
import 'package:b2s/screens/business_selling_screen.dart';
import 'package:b2s/screens/listing_detail_screen.dart';
import 'package:b2s/screens/favourite_listing_screen.dart';
import 'package:b2s/widgets/businesslisting_in_gridview.dart';
import 'package:b2s/screens/home_screen.dart';
import 'package:b2s/utils/routes/routes_name.dart';
import 'package:b2s/screens/home_screen.dart.bak';
import 'package:b2s/screens/get_started_screen.dart';
import 'package:b2s/screens/dashboard_screen.dart';
import 'package:b2s/screens/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes{
  static appRoutes() => [
    GetPage(
      name: RoutesName.splashScreen,
      page: () => const SplashScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: RoutesName.getStartedScreen,
      page: () => const GetStartedScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: RoutesName.homeScreen,
      page: () => HomeScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 250),
      // binding: BottomBarItemsBindings()
    ),
    GetPage(
      name: RoutesName.dashboardScreen,
      page: () =>  DashboardScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: RoutesName.detailScreen,
      page: () => DetailScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: RoutesName.favouriteListingScreen,
      page: () => FavouriteListingScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: RoutesName.businessListingScreen,
      page: () => BusinessListingScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: RoutesName.businessBrokerScreen,
      page: () => BusinessBrokerScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: RoutesName.businessBrokerDetailScreen,
      page: () => BusinessBrokerDetailScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: RoutesName.businessSellingScreen,
      page: () => BusinessSellingScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: RoutesName.brokerProductsScreen,
      page: () => BrokerProductsScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: RoutesName.loginProgressScreen,
      page: () => LoginProgressScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: RoutesName.privateSellerRegistrationScreen,
      page: () => PrivateSellerRegistrationScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: RoutesName.buyerRegistrationScreen,
      page: () => BuyerRegistrationScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: RoutesName.forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: RoutesName.verifyEmailScreen,
      page: () => VerifyEmailScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: RoutesName.resetPasswordScreen,
      page: () => ResetPasswordScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 250),
    ),
  ];
}