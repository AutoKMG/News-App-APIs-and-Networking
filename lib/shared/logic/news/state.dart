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
