import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/model/hit.dart';
import '../../../../domain/search_api.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final SearchApi _api;

  HomeBloc(this._api) : super(HomeInitial()) {
    on<HomeSearch>(_search);
    on<HomeSetPage>(_setPage);
    on<HomeSimilarSearch>(_searchSimilar);
    on<HomeExtendedSearch>(_searchExtended);
  }

  String _pattern = '';
  int _page = 1;

  void _search(HomeSearch event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    _page = 1;
    _pattern = event.pattern;
    try {
      final response = await _api.search(_pattern);
      emit(HomeResults(
        total: response.total,
        currentPage: _page,
        results: response.hits,
      ));
    } on Exception {
      // TODO: errors
      emit(HomeInitial());
    }
  }

  void _setPage(HomeSetPage event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    _page = event.page;
    try {
      // TODO: similar
      final response = await _api.search(_pattern, page: _page);
      emit(HomeResults(
        total: response.total,
        currentPage: _page,
        results: response.hits,
      ));
    } on Exception {
      emit(HomeInitial());
    }
  }

  void _searchSimilar(HomeSimilarSearch event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    _page = 1;
    try {
      final response = await _api.searchSimilar(event.id);
      emit(HomeResults(
        total: response.total,
        currentPage: _page,
        results: response.hits,
      ));
    } on Exception {
      emit(HomeInitial());
    }
  }

  void _searchExtended(
    HomeExtendedSearch event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    _page = 1;
    try {
      final response = await _api.searchExtended(
        event.number,
        arguments: {
          'filter': {
            'date_published:search': {
              'range': {
                'gte': event.dateFrom,
                'lte': event.dateTo,
              },
            },
          },
        },
      );
      emit(HomeResults(
        total: response.total,
        currentPage: _page,
        results: response.hits,
      ));
    } on Exception {
      emit(HomeInitial());
    }
  }
}
