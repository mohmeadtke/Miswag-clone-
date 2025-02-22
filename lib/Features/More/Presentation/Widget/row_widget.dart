import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pages/user_page.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({
    super.key,
    required this.iconData,
    required this.text,
    required this.widget,
  });
  final IconData iconData;
  final String text;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 60,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(width: 10),
                  Icon(iconData),
                  const SizedBox(width: 8),
                  Text(
                    text,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () async {
            if (text == 'Login or create new account') {
              User? user = FirebaseAuth.instance.currentUser;

              if (user != null) {
                // Reload the user to update the emailVerified property
                await user.reload();
                user = FirebaseAuth
                    .instance.currentUser; // Get the updated user instance

                if (user!.emailVerified) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UserPage()),
                  );
                } else {
                  // Email is not verified; navigate to authentication or show a message.
                  Navigator.pushNamed(context, '/auth');
                }
              } else {
                Navigator.pushNamed(context, '/auth');
              }
              return;
            }
            if (text == "Language" ||
                text == "Gift cards" ||
                text == "Help Center" ||
                text == "App Icon") {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('This feature not implemented yet'),
                  duration: Duration(seconds: 1),
                ),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => widget),
              );
            }
          },
          child: Container(
            color: const Color.fromARGB(0, 0, 0, 0),
            height: 60,
            width: double.infinity,
          ),
        ),
      ],
      // child:
    );
  }
}
