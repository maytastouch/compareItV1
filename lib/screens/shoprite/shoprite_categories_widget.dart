import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemy/screens/shoprite/shoprite_feeds_screen.dart';
import 'package:udemy/widgets/text_widget.dart';

import '../../provider/dark_theme_provider.dart';

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
      const ShopriteFeedsScreen(),
      const ShopriteFeedsScreen(),
      const ShopriteFeedsScreen(),
      const ShopriteFeedsScreen(),
      const ShopriteFeedsScreen(),
      const ShopriteFeedsScreen(),
      const ShopriteFeedsScreen(),
      const ShopriteFeedsScreen(),
      const ShopriteFeedsScreen(),
      const ShopriteFeedsScreen(),
      const ShopriteFeedsScreen(),
      const ShopriteFeedsScreen(),
      const ShopriteFeedsScreen(),
      const ShopriteFeedsScreen(),
      const ShopriteFeedsScreen(),
      const ShopriteFeedsScreen(),
      const ShopriteFeedsScreen(),
      const ShopriteFeedsScreen(),
      const ShopriteFeedsScreen(),
      const ShopriteFeedsScreen(),
      const ShopriteFeedsScreen(),
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
            TextWidget(
                text: catText, color: color, textSize: 13, isTitle: true),
          ],
        ),
      ),
    );
  }
}
