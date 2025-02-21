import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miswag/Features/LogIn-auth/Presentation/pages/log_in_page.dart';
import 'package:miswag/Features/LogIn-auth/Presentation/pages/verifie_page.dart';
import 'package:miswag/Features/home/Presentation/state_mangment/bloc/main_page_bloc.dart';
import 'package:miswag/bottom_bar.dart';
import 'Features/LogIn-auth/Presentation/pages/sign_in_page.dart';
import 'Features/LogIn-auth/Presentation/state_mangment/bloc/auth_bloc.dart';
import 'auth_check.dart';
import 'ingectchin.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        // '/1': (context) => const CategoriesPage(),
        '/': (context) => BlocProvider(
              create: (context) => di.sl<MainPageBloc>(),
              child: const MainScreen(),
            ),
        '/auth': (context) => const Auth(),
        '/SignIn': (context) => BlocProvider(
              create: (context) => di.sl<AuthBloc>(),
              child: const SignInPage(),
            ),
        '/LogIn': (context) => BlocProvider(
              create: (context) => di.sl<AuthBloc>(),
              child: const LogInPage(),
            ),
        '/Verifie': (context) => BlocProvider(
              create: (context) => di.sl<AuthBloc>(),
              child: VerifiePage(),
            ),
        // '/mainPage': (context) => const MainPage()
      },
    );
  }
}
