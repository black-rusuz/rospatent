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

class HomeSetPage extends HomeEvent {
  final int page;

  const HomeSetPage(this.page);

  @override
  List<Object?> get props => [page];
}

class HomeSimilarSearch extends HomeEvent {
  final String id;

  const HomeSimilarSearch(this.id);

  @override
  List<Object?> get props => [id];
}

class HomeExtendedSearch extends HomeEvent {
  final String number;
  final String dateFrom;
  final String dateTo;
  final String author;
  final String patentee;

  const HomeExtendedSearch({
    required this.number,
    required this.dateFrom,
    required this.dateTo,
    required this.author,
    required this.patentee,
  });

  @override
  List<Object?> get props => [
        number,
        dateFrom,
        dateTo,
        author,
        patentee,
      ];
}
