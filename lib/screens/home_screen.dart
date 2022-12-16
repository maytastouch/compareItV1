import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import 'package:udemy/services/utils.dart';
import 'package:udemy/widgets/categories_widget.dart';
import 'package:udemy/widgets/text_widget.dart';

import '../provider/dark_theme_provider.dart';
import '../widgets/home_screen_categories_widget.dart';

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

    // ignore: unused_local_variable

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: true,
            snap: false,
            centerTitle: false,
            //foregroundColor: Colors.transparent,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            bottom: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              title: Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: Colors.grey,
                    width: 3,
                  ),
                ),
                child: const Center(
                  child: TextField(
                    decoration: InputDecoration(
                        //move icon to the right
                        prefixIcon: Icon(IconlyLight.search),
                        //icon: Icon(IconlyLight.search),
                        hintText: 'Search Item',
                        border: InputBorder.none,
                        hintStyle:
                            TextStyle(color: Color.fromRGBO(255, 169, 106, 1)),
                        contentPadding: EdgeInsets.all(12)),
                  ),
                ),
              ),
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: size.height * 0.33,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Image.asset(
                      _offerImages[index],
                      fit: BoxFit.fill,
                    );
                  },
                  autoplay: false,
                  itemCount: _offerImages.length,
                  pagination: const SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                      color: Colors.white,
                      activeColor: Color.fromRGBO(255, 169, 106, 1),
                    ),
                  ),
                  // control: const SwiperControl(color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    themeState ? const EdgeInsets.all(0) : EdgeInsets.all(8.0),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  padding: EdgeInsets.zero,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: size.width / (size.height * 0.51),
                  children: List.generate(4, (index) {
                    return HomeScreenCategoriesWidget(
                      catText: storeInfo[index]['catText'],
                      imgPath: storeInfo[index]['imgPath'],
                      passedColor: gridColors[index],
                    );
                  }),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
