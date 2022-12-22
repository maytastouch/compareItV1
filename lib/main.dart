import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:udemy/screens/btm_bar.dart';
import 'package:udemy/screens/checkers/checkersProductDetails.dart';
import 'package:udemy/screens/foodLovers/foodLoversProductDetails.dart';
import 'package:udemy/screens/pay/pickNpayProductDetails.dart';
import 'package:udemy/screens/shoprite/shopriteProductDetails.dart';

import 'package:udemy/screens/shoprite/shoprite_categories_screen.dart';

import 'consts/theme_data.dart';
import 'provider/dark_theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    // TODO: implement initState
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        })
      ],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: Styles.themeData(themeProvider.getDarkTheme, context),
          home: const BottomBarScreen(),
          routes: {
            ShopriteCategoriesScreen.routeName: (ctx) =>
                ShopriteCategoriesScreen(),
            ShopriteProductDetails.routeName: (ctx) => ShopriteProductDetails(),
            PicknPayProductDetails.routeName: (ctx) => PicknPayProductDetails(),
            FoodLoversProductDetails.routeName: (ctx) =>
                FoodLoversProductDetails(),
            CheckersProductDetails.routeName: (ctx) => CheckersProductDetails(),
          },
        );
      }),
    );
  }
}
