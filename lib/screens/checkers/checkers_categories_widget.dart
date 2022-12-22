import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:udemy/widgets/text_widget.dart';

import '../../provider/dark_theme_provider.dart';
import 'feedsScreen/checkers_feeds_screen.dart';

class CheckersCategoriesWidget extends StatelessWidget {
  const CheckersCategoriesWidget({
    super.key,
    required this.catText,
    required this.imgPath,
    required this.passedColor,
    required this.index,
  });
  final String catText, imgPath;
  final Color passedColor;
  final int index;

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    double _screenWidth = MediaQuery.of(context).size.width;

    List<Widget> route = [
      const CheckersFeedsScreen(),
      const CheckersFeedsScreen(),
      const CheckersFeedsScreen(),
      const CheckersFeedsScreen(),
      const CheckersFeedsScreen(),
      const CheckersFeedsScreen(),
      const CheckersFeedsScreen(),
      const CheckersFeedsScreen(),
      const CheckersFeedsScreen(),
      const CheckersFeedsScreen(),
      const CheckersFeedsScreen(),
      const CheckersFeedsScreen(),
      const CheckersFeedsScreen(),
      const CheckersFeedsScreen(),
      const CheckersFeedsScreen(),
      const CheckersFeedsScreen(),
      const CheckersFeedsScreen(),
      const CheckersFeedsScreen(),
      const CheckersFeedsScreen(),
      const CheckersFeedsScreen(),
      const CheckersFeedsScreen(),
      const CheckersFeedsScreen(),
      const CheckersFeedsScreen(),
      const CheckersFeedsScreen(),
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
