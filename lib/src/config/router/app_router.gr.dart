// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomeView(key: args.key),
      );
    },
    StartRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StartView(),
      );
    },
    CatDetailRoute.name: (routeData) {
      final args = routeData.argsAs<CatDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CatDetailView(
          key: args.key,
          cat: args.cat,
        ),
      );
    },
  };
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<HomeRouteArgs> page = PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [StartView]
class StartRoute extends PageRouteInfo<void> {
  const StartRoute({List<PageRouteInfo>? children})
      : super(
          StartRoute.name,
          initialChildren: children,
        );

  static const String name = 'StartRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CatDetailView]
class CatDetailRoute extends PageRouteInfo<CatDetailRouteArgs> {
  CatDetailRoute({
    Key? key,
    required Cat cat,
    List<PageRouteInfo>? children,
  }) : super(
          CatDetailRoute.name,
          args: CatDetailRouteArgs(
            key: key,
            cat: cat,
          ),
          initialChildren: children,
        );

  static const String name = 'CatDetailRoute';

  static const PageInfo<CatDetailRouteArgs> page =
      PageInfo<CatDetailRouteArgs>(name);
}

class CatDetailRouteArgs {
  const CatDetailRouteArgs({
    this.key,
    required this.cat,
  });

  final Key? key;

  final Cat cat;

  @override
  String toString() {
    return 'CatDetailRouteArgs{key: $key, cat: $cat}';
  }
}
