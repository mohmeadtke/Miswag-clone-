import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:miswag/Features/home/Domain/usecase/main_page_usecase.dart';

part 'main_page_event.dart';
part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  final MainPageUsecase mainPageUsecase;

  MainPageBloc({required this.mainPageUsecase}) : super(InitialState()) {
    // Trigger LoadDataEvent when the bloc is created

    on<LoadDataEvent>((event, emit) async {
      emit(LodingState());
      final failureOrMainPageEntity = await mainPageUsecase.call();
      emit(await failureOrMainPageEntity.fold(
          (failure) => FailureState(message: failure.toString()),
          (data) => SuccessState(mainPageEntity: data)));
    });
  }
}
