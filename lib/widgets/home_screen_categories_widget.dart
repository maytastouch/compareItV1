import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemy/widgets/text_widget.dart';

import '../provider/dark_theme_provider.dart';
import '../screens/shoprite/shoprite_categories_screen.dart';

class HomeScreenCategoriesWidget extends StatelessWidget {
  const HomeScreenCategoriesWidget(
      {super.key,
      required this.catText,
      required this.imgPath,
      required this.passedColor});
  final String catText, imgPath;
  final Color passedColor;

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    double _screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ShopriteCategoriesScreen.routeName,
            arguments: catText);
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
                text: catText, color: color, textSize: 24, isTitle: true),
          ],
        ),
      ),
    );
  }
}
