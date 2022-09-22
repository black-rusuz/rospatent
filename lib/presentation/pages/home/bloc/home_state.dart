part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeResults extends HomeState {
  final int total;
  final int currentPage;
  final List<Hit> results;

  const HomeResults({
    required this.total,
    required this.currentPage,
    required this.results,
  });

  @override
  List<Object> get props => [total, currentPage, ...results];
}
