part of 'button_bloc.dart';

sealed class ButtonEvent extends Equatable {
  const ButtonEvent();

  @override
  List<Object> get props => [];
}

class ButtonPressed extends ButtonEvent {
  final int index;
  const ButtonPressed({required this.index});
}
