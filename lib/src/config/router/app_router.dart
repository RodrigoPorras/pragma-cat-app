import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pragma_cat_app/src/domain/models/cat.dart';
import 'package:pragma_cat_app/src/presentation/views/cat_detail/cat_detail_view.dart';
import 'package:pragma_cat_app/src/presentation/views/home/home_view.dart';
import 'package:pragma_cat_app/src/presentation/views/start/start_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: StartRoute.page, path: '/'),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: CatDetailRoute.page),
      ];
}

final appRouter = AppRouter();
