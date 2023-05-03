import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pragma_cat_app/generated/l10n.dart';
import 'package:pragma_cat_app/src/config/router/app_router.dart';
import 'package:pragma_cat_app/src/config/themes/color_schemes.dart';
import 'package:pragma_cat_app/src/domain/repositories/the_cat_api_repository.dart';
import 'package:pragma_cat_app/src/locator.dart';
import 'package:pragma_cat_app/src/presentation/cubits/cats/cats_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CatsCubit(locator<TheCatApiRepository>())..getCats(),
          lazy: false,
        ),
      ],
      child: OKToast(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter.config(),
          theme: ThemeData(colorScheme: lightColorScheme),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
        ),
      ),
    );
  }
}
