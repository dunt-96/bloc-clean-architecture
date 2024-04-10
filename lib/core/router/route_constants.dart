import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template/features/not_found_page/not_found_page.dart';

class Routes {
  static const authPageName = '/';
  static const homeDetailsNamedPage = 'details';
  static const profileNamedPage = '/profile';
  static const profileDetailsNamedPage = 'details';
  static const settingsNamedPage = '/settings';
  static Widget errorWidget(BuildContext context, GoRouterState state) =>
      const NotFoundScreen();
}
