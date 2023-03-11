part of 'handler.dart';

@immutable
abstract class NewsState {}

class NewsStateInitial extends NewsState {}

class NewsStateIndexChanged extends NewsState {}

class NewsStateGetBusinessLoading extends NewsState {}

class NewsStateGetBusinessSuccess extends NewsState {}

class NewsStateGetBusinessError extends NewsState {
  final String error;

  NewsStateGetBusinessError(this.error);
}

class NewsStateGetSportsLoading extends NewsState {}

class NewsStateGetSportsSuccess extends NewsState {}

class NewsStateGetSportsError extends NewsState {
  final String error;

  NewsStateGetSportsError(this.error);
}

class NewsStateGetScienceLoading extends NewsState {}

class NewsStateGetScienceSuccess extends NewsState {}

class NewsStateGetScienceError extends NewsState {
  final String error;

  NewsStateGetScienceError(this.error);
}

class NewsStateGetSearchLoading extends NewsState {}

class NewsStateGetSearchSuccess extends NewsState {}

class NewsStateGetSearchError extends NewsState {
  final String error;

  NewsStateGetSearchError(this.error);
}

class NewsStateToggleDirectionality extends NewsState {}

class NewsStateToggleDarkTheme extends NewsState {}

class NewsStateCountryChanged extends NewsState {}
