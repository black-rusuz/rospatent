part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class HomeSearch extends HomeEvent {
  final String pattern;

  const HomeSearch(this.pattern);

  @override
  List<Object?> get props => [pattern];
}
