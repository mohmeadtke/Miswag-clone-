import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miswag/Features/home/Domain/entity/main_page_entity.dart';
import 'package:miswag/Features/home/Presentation/state_mangment/bloc/main_page_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
              onTap: () {},
              child: Image.asset(
                "assets/image/heart.png",
                width: 25,
                height: 30,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            InkWell(
              onTap: () {},
              child: Image.asset(
                "assets/image/chat.png",
                width: 25,
                height: 22,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
          ],
          title: const Padding(
              padding: EdgeInsets.only(left: 144),
              child: Text(
                "miswag",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 27,
                    fontWeight: FontWeight.bold),
              )),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Container(
                height: 45,
                width: 380,
                color: Colors.white,
                child: GestureDetector(
                  onTap: () {
                    // Handle search action here
                    print('Search button tapped');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300], // Set background color to gray
                      borderRadius:
                          BorderRadius.circular(15.0), // Rounded corners
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: const Row(
                      children: [
                        Icon(Icons.search, color: Colors.black), // Search icon
                        SizedBox(width: 8.0),
                        Expanded(
                          child: TextField(
                            enabled:
                                false, // Disable editing, makes it look like a button
                            decoration: InputDecoration(
                              hintText:
                                  "I'm looking for...", // Placeholder text
                              border: InputBorder.none, // Remove borders
                            ),
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            Container(
              color: Colors.white,
            ),
            Expanded(
              child: BlocBuilder<MainPageBloc, MainPageState>(
                builder: (context, state) {
                  if (state is LodingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is SuccessState) {
                    final data = state.mainPageEntity;

                    return Center(
                      child: ListView.builder(
                        // shrinkWrap: true,
                        itemCount: data.length, // The length of the outer list
                        itemBuilder: (context, index) {
                          MainPageEntity product = data[index];

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: ListTile(
                                // leading: Image.network(
                                //     product.image), // Display image if available
                                title: Text(product.name),
                                subtitle: Text(
                                    "${product.category} - \$${product.price}"),
                                trailing:
                                    Text("\$${product.priceAfterDiscount}"),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                  if (state is FailureState) {
                    return Center(
                      child: Text("${state.message} "),
                    );
                  } else {
                    BlocProvider.of<MainPageBloc>(context).add(LoadDataEvent());
                    return Center(
                      child: Container(
                        color: Colors.green,
                        width: 100,
                        height: 100,
                        child: Text("dadad"),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ));
  }
}
