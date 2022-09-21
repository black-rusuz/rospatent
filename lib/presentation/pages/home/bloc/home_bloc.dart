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
      // TODO: pass page
      final response = await _api.search(_pattern);
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
