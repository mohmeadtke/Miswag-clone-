import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'core/class/boll.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // Check if the stream has data
          if (snapshot.connectionState == ConnectionState.active) {
            final user = snapshot.data;

            if (user != null) {
              Future.microtask(
                  () => Navigator.pushReplacementNamed(context, '/Verifie'));
            } else {
              // Navigate to the SignIn page
              Future.microtask(
                  () => Navigator.pushReplacementNamed(context, '/LogIn'));
            }
          }

          // While the stream is loading or there's no data yet
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
