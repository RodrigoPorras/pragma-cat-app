import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pragma_cat_app/src/data/datasources/remote/the_cat_api_service.dart';
import 'package:pragma_cat_app/src/data/repositories/the_cat_api_repository_impl.dart';
import 'package:pragma_cat_app/src/domain/repositories/the_cat_api_repository.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  final dio = Dio();

  dio.interceptors.add(AwesomeDioInterceptor());

  locator.registerSingleton<Dio>(dio);

  locator
      .registerSingleton<TheCatApiService>(TheCatApiService(locator<Dio>()));
  locator.registerSingleton<TheCatApiRepository>(
      TheCatApiRepositoryImpl(locator<TheCatApiService>()));
}
