import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miswag/Features/home/Presentation/state_mangment/bloc/main_page_bloc.dart';
import 'package:miswag/core/Widget/app_bar_widget.dart';
import 'liked_page.dart';

class LikeBlocBuilderWidget extends StatelessWidget {
  const LikeBlocBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(pageNum: 3),
      body: BlocBuilder<MainPageBloc, MainPageState>(
        builder: (context, state) {
          if (state is LodingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is SuccessState) {
            List data = state.mainPageEntity;
            return LikedPage(data: data);
          }
          if (state is FailureState) {
            return Center(
              child: Text("${state.message} "),
            );
          } else {
            BlocProvider.of<MainPageBloc>(context).add(LoadDataEvent());
            return const Center(
              child: Text(""),
            );
          }
        },
      ),
    );
  }
}
