import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../feature/detail/presentation/page/page.dart';
import '../../feature/home/presentation/page/home_page.dart';
import '../../feature/maps/presentation/page/page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
          path: '/',
        ),
        AutoRoute(
          page: DetailRoute.page,
          path: '/movie/:id',
        ),
        AutoRoute(
          page: MapDetailRoute.page,
          path: '/maps/:lat/:long',
        ),
        AutoRoute(
          page: MapsRoute.page,
          path: '/maps/',
        ),
      ];
}
