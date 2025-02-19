import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miswag/Features/Categories/Presentation/pages/categories_page.dart';
import 'package:miswag/Features/home/Presentation/state_mangment/bloc/main_page_bloc.dart';
import 'package:miswag/bottom_bar.dart';
import 'ingectchin.dart' as di;

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Miswag app',
      routes: {
        '/1': (context) => const CategoriesPage(),
        '/': (context) => BlocProvider(
              create: (context) => di.sl<MainPageBloc>(),
              child: const MainScreen(),
            ),
      },
    );
  }
}
