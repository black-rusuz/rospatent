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
  }

  void _search(HomeSearch event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final response = await _api.search(event.pattern);
      emit(HomeResults(total: response.total, results: response.hits));
    } on Exception {
      emit(HomeInitial());
    }
  }
}
