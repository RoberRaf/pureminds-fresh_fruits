import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pure_minds/features/product/cubit/product_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final di = GetIt.instance;

Future init() async {
  // di.registerSingleton<IsarServices>(IsarServices());
  di.registerSingletonAsync<SharedPreferences>(() => SharedPreferences.getInstance());
  // di.registerSingletonAsync<PackageInfo>(() => PackageInfo.fromPlatform());
  // di.registerLazySingleton<ApiClient>(() => ApiClient());

  // Cubits
  di.registerCachedFactoryParam<ProductCubit, int, Null>((p1, p2) => ProductCubit(p1));
  await Future.delayed(Durations.short1);
}
