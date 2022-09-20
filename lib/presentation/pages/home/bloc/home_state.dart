part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeResults extends HomeState {
  final List results;

  const HomeResults({required this.results});

  @override
  List<Object> get props => [...results];
}
