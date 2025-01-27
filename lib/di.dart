import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final di = GetIt.instance;

Future init() async {
  // di.registerSingleton<IsarServices>(IsarServices());
  di.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());
  // di.registerSingletonAsync<PackageInfo>(() => PackageInfo.fromPlatform());
  // di.registerLazySingleton<ApiClient>(() => ApiClient());


  // Cubits
}
