import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final sl = GetIt.instance;

@InjectableInit()
void configureDependencies() async => $initGetIt(sl);

@module
abstract class RegisterModule {
  @Singleton()
  http.Client get client => http.Client();
}
