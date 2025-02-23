import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miswag/Features/home/Presentation/Widget/listViewWidget/bloc_builder_widget.dart';
import 'package:miswag/Features/home/Presentation/Widget/listViewWidget/list_view_widget.dart';
import 'package:miswag/Features/home/Presentation/state_mangment/bloc/main_page_bloc.dart';
import 'package:miswag/Features/serch/Widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Request focus to open the keyboard after the page is loaded
    Future.delayed(Duration(milliseconds: 100), () {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: TextField(
          focusNode: _focusNode,
          controller: _searchController,
          onChanged: (text) {
            setState(() {}); // Update UI when text changes
          },
          decoration: InputDecoration(
            hintText: "Type here...",
            border: InputBorder.none,
            hintStyle: const TextStyle(color: Colors.grey),
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.close, color: Colors.black),
                    onPressed: () {
                      _searchController.clear();
                      setState(() {}); // Refresh UI to hide 'X' button
                    },
                  )
                : null,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: _searchController.text.isNotEmpty
          ? Scaffold(
              body: SizedBox(
                child: Container(
                  color: Colors.grey[100],
                  width: 500,
                  height: 760,
                  child: BlocBuilder<MainPageBloc, MainPageState>(
                    builder: (context, state) {
                      if (state is LodingState) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (state is SuccessState) {
                        List data = state.mainPageEntity;
                        return ListViewWidgett(
                          data: data,
                          searchText: _searchController.text,
                        );
                      }
                      if (state is FailureState) {
                        return Center(
                          child: Text("${state.message} "),
                        );
                      } else {
                        BlocProvider.of<MainPageBloc>(context)
                            .add(LoadDataEvent());
                        return const Center(
                          child: Text(""),
                        );
                      }
                    },
                  ),
                ),
              ),
            )
          : const Scaffold(
              body: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                BlocBuilderWidget(text: "Cosmetics"),
                SizedBox(
                  height: 60,
                ),
                BlocBuilderWidget(text: "Watches"),
              ],
            ) // Replace with your widget when text is empty
              ),
    );
  }
}
