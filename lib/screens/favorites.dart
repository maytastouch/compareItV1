import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:udemy/services/utils.dart';

import '../widgets/categories_widget.dart';
import '../widgets/text_widget.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Color color = utils.color;
    return const Scaffold(
      body: Center(child: Text("Favorites")),
    );
  }
}
