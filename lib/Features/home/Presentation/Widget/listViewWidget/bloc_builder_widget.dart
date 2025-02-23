import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miswag/Features/home/Presentation/Widget/see_more_widget.dart';
import 'package:miswag/Features/home/Presentation/state_mangment/bloc/main_page_bloc.dart';
import 'list_view_widget.dart';

class BlocBuilderWidget extends StatelessWidget {
  const BlocBuilderWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SeeMoreWidget(text: text),
        BlocBuilder<MainPageBloc, MainPageState>(
          builder: (context, state) {
            if (state is LodingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is SuccessState) {
              List data = state.mainPageEntity;
              print(data);
              return ListViewWidget(data: data);
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
      ],
    );
  }
}
