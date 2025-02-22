import 'package:flutter/material.dart';
import '../Widget/back_grond.dart';
import '../Widget/bloc_form.dart';
import '../Widget/return_button.dart';
import '../Widget/toptext.dart';
import '../Widget/undre_line_text.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            // Background image
            Backgrond(),

            // Form content
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App title
                Toptext(text: "Sign in"),

                Spacer(),
                // Form
                BlocForm(buttonText: 'sign-in', x: 0),

                // Spacer to push the "Create your account" text to the bottom
                Spacer(),
                // Create Account Text centered at the bottom
              ],
            ),
            ReturnButton(),
          ],
        ),
      ),
    );
  }
}
