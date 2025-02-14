part of 'main_page_bloc.dart';

sealed class MainPageState extends Equatable {
  const MainPageState();

  @override
  List<Object> get props => [];
}

final class InitialState extends MainPageState {}

final class LodingState extends MainPageState {}

final class SuccessState extends MainPageState {
  final List mainPageEntity;

  const SuccessState({required this.mainPageEntity});
}

final class FailureState extends MainPageState {
  final String message;

  const FailureState({required this.message});
}
