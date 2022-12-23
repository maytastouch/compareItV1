import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:udemy/screens/pay/pickNpay_categories_widget.dart';
import 'package:udemy/services/utils.dart';

import '../../widgets/categories_widget.dart';
import '../../widgets/text_widget.dart';

class PicknPayCategoriesScreen extends StatelessWidget {
  PicknPayCategoriesScreen({super.key});
  static const routeName = "PicknPayCategoriesScreen";

  List<Color> gridColors = [
    const Color(0xff53B175),
    const Color(0xffF8A44C),
    const Color(0xffF7A593),
    const Color(0xffD3B0E0),
    const Color(0xffFDE598),
    const Color(0xffB7DFF5),
    const Color(0xff53B175),
    const Color(0xffF8A44C),
    const Color(0xffF7A593),
    const Color(0xffD3B0E0),
    const Color(0xffFDE598),
    const Color(0xffB7DFF5),
    const Color(0xff53B175),
    const Color(0xffF8A44C),
    const Color(0xffF7A593),
    const Color(0xffD3B0E0),
    const Color(0xffFDE598),
    const Color(0xffB7DFF5),
    const Color(0xff53B175),
    const Color(0xffF8A44C),
    const Color(0xffF7A593),
    const Color(0xffD3B0E0),
    const Color(0xffFDE598),
    const Color(0xffB7DFF5),
  ];

  List<Map<String, dynamic>> catInfo = [
    {
      'imgPath': 'assets/images/cat/fruits.png',
      'catText': 'Vegetables',
    },
    {
      'imgPath': 'assets/images/cat/veg.png',
      'catText': 'Fresh Fruits',
    },
    {
      'imgPath': 'assets/images/pickNpay/bakery3.png',
      'catText': 'Bakery',
    },
    {
      'imgPath': 'assets/images/cat/nuts.png',
      'catText': 'Milk,Duary and Eggs',
    },
    {
      'imgPath': 'assets/images/cat/spices.png',
      'catText': 'Deli and Party',
    },
    {
      'imgPath': 'assets/images/cat/grains.png',
      'catText': 'Ready Meals and Desserts',
    },
    {
      'imgPath': 'assets/images/cat/fruits.png',
      'catText': 'Meat, Poultry and Fish',
    },
    {
      'imgPath': 'assets/images/cat/veg.png',
      'catText': 'Beverages',
    },
    {
      'imgPath': 'assets/images/cat/Spinach.png',
      'catText': 'Frozen Food',
    },
    {
      'imgPath': 'assets/images/cat/nuts.png',
      'catText': 'Food Cupboard',
    },
    {
      'imgPath': 'assets/images/cat/spices.png',
      'catText': 'Snack Cupboard',
    },
    {
      'imgPath': 'assets/images/pickNpay/beer2.png',
      'catText': 'Beer, Cider and Seltzer',
    },
    {
      'imgPath': 'assets/images/cat/fruits.png',
      'catText': 'Wine and Spirits',
    },
    {
      'imgPath': 'assets/images/cat/veg.png',
      'catText': 'Household and Cleaning',
    },
    {
      'imgPath': 'assets/images/cat/Spinach.png',
      'catText': 'Personal Care and Hygiene',
    },
    {
      'imgPath': 'assets/images/pickNpay/baby1.png',
      'catText': 'Baby',
    },
    {
      'imgPath': 'assets/images/cat/spices.png',
      'catText': 'Health and Wellnes',
    },
    {
      'imgPath': 'assets/images/cat/grains.png',
      'catText': 'Home and Outdoor',
    },
    {
      'imgPath': 'assets/images/cat/fruits.png',
      'catText': 'Newsstand',
    },
    {
      'imgPath': 'assets/images/cat/veg.png',
      'catText': 'Pet Care',
    },
    {
      'imgPath': 'assets/images/cat/Spinach.png',
      'catText': 'Herbs',
    },
    {
      'imgPath': 'assets/images/cat/nuts.png',
      'catText': 'Nuts',
    },
    {
      'imgPath': 'assets/images/cat/spices.png',
      'catText': 'Spices',
    },
    {
      'imgPath': 'assets/images/cat/grains.png',
      'catText': 'Grains',
    },
  ];
  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Color color = utils.color;
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              IconlyLight.arrowLeft2,
              color: color,
            ),
          ),
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: TextWidget(
            text: 'PicknPay',
            color: color,
            textSize: 24,
            isTitle: true,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 3,
            childAspectRatio: 180 / 260,
            crossAxisSpacing: 20, // Vertical spacing
            mainAxisSpacing: 20, // Horizontal spacing
            children: List.generate(gridColors.length, (index) {
              return PicknPayCategoriesWidget(
                catText: catInfo[index]['catText'],
                imgPath: catInfo[index]['imgPath'],
                passedColor: gridColors[index],
                index: index,
              );
            }),
          ),
        ));
  }
}
