import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

part 'button_event.dart';
part 'button_state.dart';

class ButtonBloc extends Bloc<ButtonEvent, ButtonState> {
  ButtonBloc() : super(InitialState()) {
    on<ButtonPressed>(
      (event, emit) async {
        emit(LoadingState(index: event.index)); // Show loading indicator

        // Simulate a delay to load data
        await Future.delayed(const Duration(seconds: 1));

        emit(LoadedState(index: event.index)); // Show LoadedState with index
      },
      transformer:
          restartable(), // Cancels previous events when a new one comes in
    );
  }
}
