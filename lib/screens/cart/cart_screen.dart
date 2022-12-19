import 'package:flutter/material.dart';
import 'package:udemy/screens/cart/cart_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (ctx, index) {
          return CartWidget();
        },
      ),
    );
  }
}
