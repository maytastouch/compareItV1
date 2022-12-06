import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:udemy/widgets/text_widget.dart';

import '../provider/dark_theme_provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    // ignore: unused_local_variable
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _listTiles(
                title: 'Address2',
                subtitle: 'testing',
                icon: IconlyLight.profile,
                color: color,
                onPressed: () {}),
            _listTiles(
              title: 'Orders',
              icon: IconlyLight.bag,
              color: color,
              onPressed: () {},
            ),
            _listTiles(
              title: 'Wishlist',
              icon: IconlyLight.heart,
              color: color,
              onPressed: () {},
            ),
            _listTiles(
              title: 'Viewed',
              icon: IconlyLight.show,
              color: color,
              onPressed: () {},
            ),
            _listTiles(
              title: 'Forgot password',
              icon: IconlyLight.unlock,
              color: color,
              onPressed: () {},
            ),
            SwitchListTile(
              title: Text('Theme'),
              secondary: Icon(themeState.getDarkTheme
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined),
              onChanged: (bool value) {
                setState(() {
                  themeState.setDarkTheme = value;
                });
              },
              value: themeState.getDarkTheme,
            ),
            _listTiles(
              title: 'Logout',
              icon: IconlyLight.logout,
              color: color,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  // ignore: dead_code
  Widget _listTiles({
    required String title,
    String? subtitle,
    required IconData icon,
    required Function onPressed,
    required Color color,
  }) {
    return ListTile(
        title: TextWidget(text: title, color: color, textSize: 20),
        subtitle: TextWidget(
            text: subtitle == null ? "" : subtitle, color: color, textSize: 18),
        leading: Icon(icon),
        trailing: const Icon(IconlyLight.arrowRight2),
        onTap: () {
          onPressed;
        });
  }
}
