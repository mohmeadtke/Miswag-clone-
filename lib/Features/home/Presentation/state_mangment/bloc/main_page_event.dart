part of 'main_page_bloc.dart';

sealed class MainPageEvent extends Equatable {
  const MainPageEvent();

  @override
  List<Object> get props => [];
}

class LoadDataEvent extends MainPageEvent {}

class LoadMoreDataEvent extends MainPageEvent {}
