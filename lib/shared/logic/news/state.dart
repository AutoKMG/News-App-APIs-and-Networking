part of 'handler.dart';

@immutable
abstract class NewsState {}

class NewsStateInitial extends NewsState {}

class NewsStateIndexChanged extends NewsState {}
