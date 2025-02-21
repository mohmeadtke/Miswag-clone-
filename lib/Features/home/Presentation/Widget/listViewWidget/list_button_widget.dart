import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../bottom_sheet_cntent.dart';
import '../../../../../core/class/boll.dart';

class ListButtonWidget extends StatelessWidget {
  const ListButtonWidget({super.key, required this.product});
  final product;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 4, // Adjusted position
      left: 4, // Adjusted position
      child: InkWell(
        onTap: () {
          GlobalState().isItCart = true;
          User? user = FirebaseAuth.instance.currentUser;

          if (user != null) {
            if (user.emailVerified) {
              if (GlobalState().isItCart == true) {
                showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (context) => BottomSheetContent(product: product));
              }
              return;
            }
            Navigator.pushNamed(context, '/auth');
          }
          //! add to cart
        },
        child: Container(
          width: 30,
          height: 30,
          padding: const EdgeInsets.all(4), // Add some padding around the image
          decoration: BoxDecoration(
            color: Colors.white, // White background
            borderRadius:
                BorderRadius.circular(40), // Optional: Rounded corners
          ),
          child: Image.asset(
            fit: BoxFit.fill,
            'assets/image/cart.png', // Replace with your image path
          ),
        ),
      ),
    );
  }
}
