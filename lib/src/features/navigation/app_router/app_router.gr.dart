// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthorizationScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const AuthorizationScreen(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    UserDetailScreenRoute.name: (routeData) {
      final args = routeData.argsAs<UserDetailScreenRouteArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: UserDetailScreen(
          key: args.key,
          fullName: args.fullName,
          idUser: args.idUser,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          AuthorizationScreenRoute.name,
          path: '/',
        ),
        RouteConfig(
          HomeScreenRoute.name,
          path: '/home-screen',
        ),
        RouteConfig(
          UserDetailScreenRoute.name,
          path: '/user-detail-screen',
        ),
      ];
}

/// generated route for
/// [AuthorizationScreen]
class AuthorizationScreenRoute extends PageRouteInfo<void> {
  const AuthorizationScreenRoute()
      : super(
          AuthorizationScreenRoute.name,
          path: '/',
        );

  static const String name = 'AuthorizationScreenRoute';
}

/// generated route for
/// [HomeScreen]
class HomeScreenRoute extends PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: '/home-screen',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [UserDetailScreen]
class UserDetailScreenRoute extends PageRouteInfo<UserDetailScreenRouteArgs> {
  UserDetailScreenRoute({
    Key? key,
    String? fullName,
    required int idUser,
  }) : super(
          UserDetailScreenRoute.name,
          path: '/user-detail-screen',
          args: UserDetailScreenRouteArgs(
            key: key,
            fullName: fullName,
            idUser: idUser,
          ),
        );

  static const String name = 'UserDetailScreenRoute';
}

class UserDetailScreenRouteArgs {
  const UserDetailScreenRouteArgs({
    this.key,
    this.fullName,
    required this.idUser,
  });

  final Key? key;

  final String? fullName;

  final int idUser;

  @override
  String toString() {
    return 'UserDetailScreenRouteArgs{key: $key, fullName: $fullName, idUser: $idUser}';
  }
}
