import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'THE_CAT_API_KEY')
  static const theCatApiKey = _Env.theCatApiKey;
}
