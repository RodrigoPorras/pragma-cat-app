import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pragma_cat_app/src/config/router/app_router.dart';

@RoutePage()
class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3))
        .then((_) => context.router.replace(HomeRoute()));

    return Container(
      color: Colors.white,
      child: Center(
        child: Image.asset(
          'assets/icon/splash_icon.png',
          height: 512,
          width: 512,
        ),
      ),
    );
  }
}
