import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miswag/Features/Categories/Presentation/Widget/exxx.dart';
import 'package:miswag/Features/Categories/Presentation/pages/beauty_page.dart';
import 'package:miswag/Features/Categories/Presentation/pages/offers_pages.dart';
import 'package:miswag/Features/Categories/Presentation/state_mangment/bloc/button_bloc.dart';
import 'package:miswag/core/Widget/app_bar_widget.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List<Widget> ui = [
    OffersPages(),
    const BeautyPage(),
    const CircularProgressIndicator(),
    const CircularProgressIndicator(),
    const CircularProgressIndicator(),
    const CircularProgressIndicator(),
    const CircularProgressIndicator(),
    const CircularProgressIndicator(),
    const CircularProgressIndicator(),
    const CircularProgressIndicator(),
  ];
  int selectedIndex = 0; // Store the selected index
  List<String> imagis = [
    "assets/image/discount.png",
    "assets/image/buty.png",
    "assets/image/air.png",
    "assets/image/knife.png",
    "assets/image/devices.png",
    "assets/image/watch.png",
    "assets/image/kit.png",
    "assets/image/xbox.png",
    "assets/image/soap.png",
    "assets/image/car.png",
  ];
  List<String> imageisText = [
    "offers And Discount",
    "Beauty",
    "Home Appliances",
    "Home,Kitchen & Garden",
    "Electronics",
    "Watches & Accessories",
    "Health & Personal Care",
    "Videw Games",
    "Cleaning Supplies",
    "Cars & Vehicles",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(
        pageNum: 2,
      ),
      body: BlocBuilder<ButtonBloc, ButtonState>(
        builder: (context, state) {
          return Row(
            children: [
              SizedBox(
                width: 110,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        setState(() {
                          selectedIndex = index;
                        });
                        context
                            .read<ButtonBloc>()
                            .add(ButtonPressed(index: selectedIndex));
                      },
                      child: Container(
                        height: 100,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? const Color.fromARGB(255, 159, 186, 250)
                                : Colors.grey[
                                    100], // Change color based on selection
                            // borderRadius: BorderRadius.circular(8),
                            border: selectedIndex == index
                                ? const Border(
                                    left: BorderSide(
                                        color: Colors.blue, width: 2.5))
                                : null),
                        child: Column(
                          children: [
                            SizedBox(
                                height: 40,
                                width: 30,
                                child: Image(image: AssetImage(imagis[index]))),
                            Center(
                              child: Text(
                                imageisText[index],
                                style: TextStyle(
                                    color: selectedIndex == index
                                        ? const Color.fromARGB(
                                            255, 62, 101, 255)
                                        : Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (state is LoadedState)
                Expanded(
                    child:
                        (state.index == state.index) ? ui[state.index] : ui[0])
              else if (state is LoadingState)
                const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              else
                ui[0]
            ],
          );
        },
      ),
    );
  }
}
