import 'package:auto_route/auto_route.dart';
import 'package:diploma_admin/src/features/auth/sign_in/ui/authorization_screen.dart';
import 'package:diploma_admin/src/features/home/ui/home_screen.dart';
import 'package:diploma_admin/src/features/user_detail/ui/user_detail.dart';

import 'package:flutter/material.dart';


export 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: AuthorizationScreen , initial: true),
    AutoRoute(page: HomeScreen),
    AutoRoute(page: UserDetailScreen),



  ],
)
class AppRouter extends _$AppRouter {
  AppRouter([
    super.navigatorKey,
  ]) {
    rootKey = super.navigatorKey;
  }

  static late final GlobalKey<NavigatorState> rootKey;
}
