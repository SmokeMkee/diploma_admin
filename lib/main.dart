
import 'package:diploma_admin/src/features/init/dependencies_provider/dependencies_provider.dart';
import 'package:diploma_admin/src/features/navigation/app_router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
final rootNavigatorKey = GlobalKey<NavigatorState>();

void main() {

  return runApp(
    DependenciesProvider(
      builder: (context) {
        return InheritedProvider<AppRouter>(
          create: (context) =>  AppRouter(
            GlobalKey<NavigatorState>(),
          ),
          child: Builder(
            builder: (context) {
              return MaterialApp.router(
                scaffoldMessengerKey: scaffoldMessengerKey,

                routerDelegate: context.read<AppRouter>().delegate(),
                routeInformationParser: context.read<AppRouter>().defaultRouteParser(),
                title: 'SimpleEducation',

                debugShowCheckedModeBanner: false,


              );
            }
          ),
        );
      },
    ),
  );
}
