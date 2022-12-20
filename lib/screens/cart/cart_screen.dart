import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:udemy/screens/cart/cart_widget.dart';

import '../../services/utils.dart';
import '../../widgets/text_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Size size = Utils(context).getScreenSize;
    Color color = utils.color;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        //align text to the start
        centerTitle: false,
        title: TextWidget(
          text: 'Cart (2)',
          textSize: 20,
          color: color,
          isTitle: true,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(IconlyBroken.delete),
            color: color,
          ),
        ],
      ),
      body: Column(
        children: [
          _checkout(ctx: context),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (ctx, index) {
                return CartWidget();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _checkout({required BuildContext ctx}) {
    final utils = Utils(ctx);
    Size size = Utils(ctx).getScreenSize;
    Color color = utils.color;

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Material(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextWidget(
                    text: 'Order now',
                    textSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Spacer(),
            FittedBox(
              child: TextWidget(
                text: 'Total: N\$50.00',
                color: color,
                textSize: 18,
                isTitle: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
