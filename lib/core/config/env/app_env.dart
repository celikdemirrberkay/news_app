import 'package:envied/envied.dart';
part 'app_env.g.dart';

/// We need to add obfuscate in order to not expose our API key to the public
@Envied(obfuscate: true, path: '.keys.env')
abstract class Env {
  @EnviedField(varName: 'API_KEY')
  static String apiKey = _Env.apiKey;
}
