part of 'button_bloc.dart';

sealed class ButtonState extends Equatable {
  const ButtonState();

  @override
  List<Object> get props => [];
}

class InitialState extends ButtonState {}

class LoadingState extends ButtonState {
  final int index;
  const LoadingState({required this.index});
}

class LoadedState extends ButtonState {
  final int index;
  const LoadedState({required this.index});
}
