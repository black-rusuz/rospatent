// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/search_api_impl.dart' as _i6;
import 'domain/search_api.dart' as _i5;
import 'injection.dart' as _i7;
import 'presentation/pages/home/bloc/home_bloc.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.Dio>(registerModule.client);
  gh.factory<_i4.HomeBloc>(() => _i4.HomeBloc());
  gh.singleton<_i5.SearchApi>(_i6.SearchApiImpl(client: get<_i3.Dio>()));
  return get;
}

class _$RegisterModule extends _i7.RegisterModule {}
