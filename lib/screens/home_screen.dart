import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import 'package:udemy/services/utils.dart';
import 'package:udemy/widgets/categories_widget.dart';
import 'package:udemy/widgets/text_widget.dart';

import '../appColors/colors.dart';
import '../provider/dark_theme_provider.dart';
import '../widgets/home_screen_categories_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  final FocusNode _searchTextFocusNode = FocusNode();

  @override
  void dispose() {
    _searchController!.dispose();
    _searchTextFocusNode.dispose();
    super.dispose();
  }

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
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: kBottomNavigationBarHeight,
                    child: TextField(
                      //new
                      focusNode: _searchTextFocusNode,
                      controller: _searchController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppColors.mainColor),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColors.mainColor, width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        hintText: "Search",
                        hintStyle: TextStyle(
                          color: color,
                          fontSize: 16,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: AppColors.mainColor,
                        ),
                        suffix: IconButton(
                          icon: Icon(
                            Icons.close,
                            color: _searchTextFocusNode.hasFocus
                                ? Colors.red
                                : color,
                          ),
                          onPressed: () {
                            _searchController!.clear();
                            _searchTextFocusNode.unfocus();
                          },
                        ),
                        //contentPadding: const EdgeInsets.all(10),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                child: ListView(
              children: [
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
                    autoplay: true,
                    itemCount: _offerImages.length,
                    pagination: const SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      builder: DotSwiperPaginationBuilder(
                        color: Colors.white,
                        activeColor: AppColors.mainColor,
                      ),
                    ),
                    // control: const SwiperControl(color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                GridView.count(
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
                        index: index,
                      );
                    }))
              ],
            ))
          ],
        ));
  }
}
