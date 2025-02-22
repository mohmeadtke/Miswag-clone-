import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../../core/Widget/bottom_sheet_cntent.dart';
import '../../../../../core/class/boll.dart';

class ListButtonWidget extends StatefulWidget {
  const ListButtonWidget({super.key, required this.product});
  final dynamic product;

  @override
  State<ListButtonWidget> createState() => _ListButtonWidgetState();
}

class _ListButtonWidgetState extends State<ListButtonWidget> {
  void _tap() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Reload the user to update the emailVerified property
      await user.reload();
      user = FirebaseAuth.instance.currentUser; // Get the updated user instance

      if (user!.emailVerified) {
        // Email is verified; proceed accordingly.
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (context) => BottomSheetContent(product: widget.product),
        );
      } else {
        // Email is not verified; navigate to authentication or show a message.
        Navigator.pushNamed(context, '/auth');
      }
    } else {
      Navigator.pushNamed(context, '/auth');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 4,
      left: 4,
      child: InkWell(
        onTap: _tap,
        child: Container(
          width: 30,
          height: 30,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Image.asset(
            'assets/image/cart.png',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
