// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/search_api_impl.dart' as _i5;
import 'domain/search_api.dart' as _i4;
import 'injection.dart' as _i7;
import 'presentation/pages/home/bloc/home_bloc.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

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
  gh.singleton<_i4.SearchApi>(_i5.SearchApiImpl(client: get<_i3.Dio>()));
  gh.factory<_i6.HomeBloc>(() => _i6.HomeBloc(get<_i4.SearchApi>()));
  return get;
}

class _$RegisterModule extends _i7.RegisterModule {}
