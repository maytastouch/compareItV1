import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemy/screens/shoprite/feedsScreens/shoprite_feeds_screen.dart';
import 'package:udemy/screens/shoprite/feedsScreens/shoprite_feeds_screen10.dart';
import 'package:udemy/screens/shoprite/feedsScreens/shoprite_feeds_screen11.dart';
import 'package:udemy/screens/shoprite/feedsScreens/shoprite_feeds_screen12.dart';
import 'package:udemy/screens/shoprite/feedsScreens/shoprite_feeds_screen6.dart';
import 'package:udemy/screens/shoprite/feedsScreens/shoprite_feeds_screen7.dart';
import 'package:udemy/screens/shoprite/feedsScreens/shoprite_feeds_screen8.dart';
import 'package:udemy/screens/shoprite/feedsScreens/shoprite_feeds_screen9.dart';
import 'package:udemy/widgets/text_widget.dart';

import '../../provider/dark_theme_provider.dart';
import 'feedsScreens/shoprite_feeds_screen13.dart';
import 'feedsScreens/shoprite_feeds_screen14.dart';
import 'feedsScreens/shoprite_feeds_screen15.dart';
import 'feedsScreens/shoprite_feeds_screen16.dart';
import 'feedsScreens/shoprite_feeds_screen17.dart';
import 'feedsScreens/shoprite_feeds_screen18.dart';
import 'feedsScreens/shoprite_feeds_screen19.dart';
import 'feedsScreens/shoprite_feeds_screen2.dart';
import 'feedsScreens/shoprite_feeds_screen20.dart';
import 'feedsScreens/shoprite_feeds_screen21.dart';
import 'feedsScreens/shoprite_feeds_screen22.dart';
import 'feedsScreens/shoprite_feeds_screen23.dart';
import 'feedsScreens/shoprite_feeds_screen24.dart';
import 'feedsScreens/shoprite_feeds_screen3.dart';
import 'feedsScreens/shoprite_feeds_screen4.dart';
import 'feedsScreens/shoprite_feeds_screen5.dart';

class ShopriteCategoriesWidget extends StatelessWidget {
  const ShopriteCategoriesWidget({
    super.key,
    required this.catText,
    required this.imgPath,
    required this.passedColor,
    required this.index,
  });
  final String catText, imgPath;
  final Color passedColor;
  final int index;
  static const marketName = "Shoprite";
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    double _screenWidth = MediaQuery.of(context).size.width;

    List<Widget> route = [
      const ShopriteFeedsScreen(),
      const ShopriteFeedsScreen2(),
      const ShopriteFeedsScreen3(),
      const ShopriteFeedsScreen4(),
      const ShopriteFeedsScreen5(),
      const ShopriteFeedsScreen6(),
      const ShopriteFeedsScreen7(),
      const ShopriteFeedsScreen8(),
      const ShopriteFeedsScreen9(),
      const ShopriteFeedsScreen10(),
      const ShopriteFeedsScreen11(),
      const ShopriteFeedsScreen12(),
      const ShopriteFeedsScreen13(),
      const ShopriteFeedsScreen14(),
      const ShopriteFeedsScreen15(),
      const ShopriteFeedsScreen16(),
      const ShopriteFeedsScreen17(),
      const ShopriteFeedsScreen18(),
      const ShopriteFeedsScreen19(),
      const ShopriteFeedsScreen20(),
      const ShopriteFeedsScreen21(),
      const ShopriteFeedsScreen22(),
      const ShopriteFeedsScreen23(),
      const ShopriteFeedsScreen24(),
    ];

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => route[index],
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: passedColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: passedColor.withOpacity(0.7), width: 2),
        ),
        child: Column(
          children: [
            Container(
              height: _screenWidth * 0.3,
              width: _screenWidth * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imgPath),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextWidget(
                  text: catText, color: color, textSize: 13, isTitle: true),
            ),
          ],
        ),
      ),
    );
  }
}
