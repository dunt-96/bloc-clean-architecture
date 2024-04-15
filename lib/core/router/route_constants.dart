import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template/features/not_found_page/not_found_page.dart';

class Routes {
  static const authPageName = '/';
  static const homePageName = '/home';
  static const homeDetailsNamedPage = 'home-details';
  static const profileNamedPage = '/profile';
  static const profileDetailsNamedPage = 'details';
  static const savedPageName = '/saved';
  static const savedDetail = 'details';
  static const explorePageName = '/explore';
  static const exploreDetails = 'details';
  static const settingsNamedPage = '/settings';
  static Widget errorWidget(BuildContext context, GoRouterState state) =>
      const NotFoundScreen();
}
