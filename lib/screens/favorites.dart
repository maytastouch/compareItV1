import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:udemy/services/utils.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  final List<String> _offerImages = [
    'assets/images/offers/Offer1.jpeg',
    'assets/images/offers/Offer2.jpeg',
    'assets/images/offers/Offer3.jpeg',
    'assets/images/offers/Offer4.jpeg'
  ];

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return const Scaffold(
        body: Center(
      child: Text('Favorites'),
    ));
  }
}
