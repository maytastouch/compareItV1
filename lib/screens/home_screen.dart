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
          //search
          Padding(
            padding:
                const EdgeInsets.only(top: 50, left: 8, right: 8, bottom: 40),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey,
                  width: 2,
                ),
              ),
              child: TextField(
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                    hintText: 'Search Item',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: color),
                    contentPadding: const EdgeInsets.all(24)),
                //textInputAction: TextInputAction.search,
                onSubmitted: (query) {
                  // Perform the search using the `query` string
                },
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
