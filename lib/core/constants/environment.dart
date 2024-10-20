import 'package:envied/envied.dart';

part 'environment.g.dart';

@Envied(
  path: '.env',
)
abstract class Env {
  //api
  @EnviedField(varName: 'BASE_URL')
  static const String baseUrl = _Env.baseUrl;

  //api_key
  @EnviedField(varName: 'API_KEY')
  static const String apiKey = _Env.apiKey;
}
