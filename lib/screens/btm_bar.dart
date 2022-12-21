import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:udemy/screens/cart/cart_screen.dart';

import 'package:udemy/screens/favorites.dart';
import 'package:udemy/screens/home_screen.dart';
import 'package:udemy/screens/user.dart';
import 'package:udemy/widgets/text_widget.dart';

import '../provider/dark_theme_provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  //initilize index
  int _selectedIndex = 0;

  final List _pages = [
    HomeScreen(),
    FavoriteScreen(),
    const CartScreen(),
    const UserScreen(),
  ];

  //method to select index
  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool _isDark = themeState.getDarkTheme;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      // ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: _isDark ? Theme.of(context).cardColor : Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _selectedPage,
        currentIndex: _selectedIndex,
        unselectedItemColor: _isDark ? Colors.white10 : Colors.black12,
        selectedItemColor: _isDark
            ? Color.fromRGBO(255, 169, 106, 1)
            : Color.fromRGBO(255, 169, 106, 1),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:
                Icon(_selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
                _selectedIndex == 1 ? IconlyBold.heart : IconlyLight.heart),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Badge(
                toAnimate: true,
                shape: BadgeShape.circle,
                badgeColor: Color.fromRGBO(255, 169, 106, 1),
                borderRadius: BorderRadius.circular(10),
                position: BadgePosition.topEnd(top: -7, end: -7),
                badgeContent: FittedBox(
                    child: TextWidget(
                        text: '1', color: Colors.white, textSize: 14)),
                child: Icon(
                    _selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy)),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(
                _selectedIndex == 3 ? IconlyBold.user2 : IconlyLight.user2),
            label: "User",
          ),
        ],
      ),
    );
  }
}
