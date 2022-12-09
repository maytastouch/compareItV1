import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:udemy/provider/dark_theme_provider.dart';
import 'package:udemy/services/utils.dart';
import 'package:udemy/widgets/categories_widget.dart';
import 'package:udemy/widgets/text_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

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
    final utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = Utils(context).getScreenSize;
    Color color = utils.color;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
          //search
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
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
//card slider
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: size.height * 0.33,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    _offerImages[index],
                    fit: BoxFit.fill,
                  );
                },
                autoplay: true,
                itemCount: _offerImages.length,
                pagination: const SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                        color: Colors.white,
                        activeColor: Color.fromRGBO(255, 169, 106, 1))),
                //control: const  SwiperControl(color: Colors.black),
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: GridView.count(
                //prevent scrolling
                //physics: const NeverScrollableScrollPhysics(),
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
