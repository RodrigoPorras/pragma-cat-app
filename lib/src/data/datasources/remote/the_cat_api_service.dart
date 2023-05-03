
import 'package:dio/dio.dart';
import 'package:pragma_cat_app/src/domain/models/cat.dart';
import 'package:pragma_cat_app/src/utils/constants/strings.dart';
import 'package:retrofit/retrofit.dart';

part 'the_cat_api_service.g.dart';

@RestApi(baseUrl: baseUrl, parser: Parser.MapSerializable)
abstract class TheCatApiService {
  factory TheCatApiService(Dio dio, {String baseUrl}) = _TheCatApiService;

  @GET('/breeds')
  Future<HttpResponse<List<Cat>>> getCats({
    @Header("x-api-key") xApiKey = theCatApiKey,
  });
}