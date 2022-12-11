import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:udemy/services/utils.dart';

import '../widgets/categories_widget.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  final List<String> _offerImages = [
    'assets/images/offers/Offer1.jpeg',
    'assets/images/offers/Offer2.jpeg',
    'assets/images/offers/Offer3.jpeg',
    'assets/images/offers/Offer4.jpeg'
  ];

  List<Color> gridColors = [
    Color.fromARGB(255, 222, 118, 92),
    Color.fromARGB(255, 173, 218, 241),
    Color.fromARGB(255, 0, 62, 23),
    Color.fromARGB(255, 13, 5, 59),
  ];

  List<Map<String, dynamic>> storeInfo = [
    {
      'imgPath': 'assets/images/shoprite.png',
      'catText': 'Shoprite',
    },
    {
      'imgPath': 'assets/images/pickNpay.png',
      'catText': 'Pick n Pay',
    },
    {
      'imgPath': 'assets/images/lovers.png',
      'catText': 'Food Lovers',
    },
    {
      'imgPath': 'assets/images/checkers.png',
      'catText': 'Checkers',
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return Scaffold();
  }
}
