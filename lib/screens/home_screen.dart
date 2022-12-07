import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemy/provider/dark_theme_provider.dart';
import 'package:udemy/services/utils.dart';
import 'package:udemy/widgets/categories_widget.dart';
import 'package:udemy/widgets/text_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  List<Color> gridColors = [
    Color.fromARGB(255, 222, 118, 92),
    Color.fromARGB(255, 173, 218, 241),
    Color.fromARGB(255, 0, 62, 23),
    Color.fromARGB(255, 3, 235, 208),
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
      'imgPath': 'assets/images/checkers.jpeg',
      'catText': 'Checkers',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Color color = utils.color;
    return Scaffold(
      appBar: AppBar(
        //left align
        centerTitle: false,
        elevation: 3,
        title: TextWidget(
            text: 'compareIt', color: color, textSize: 26, isTitle: true),
        //backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        backgroundColor: Color.fromRGBO(255, 169, 106, 1),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 20),
              //left align

              child: Text(
                'Stores',
                style: TextStyle(
                    color: color, fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 240 / 250,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: List.generate(4, (index) {
                  return CategoriesWidget(
                    catText: storeInfo[index]['catText'],
                    imgPath: storeInfo[index]['imgPath'],
                    passedColor: gridColors[index],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
