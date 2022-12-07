import 'package:flutter/gestures.dart';
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
  final TextEditingController _addressTextController =
      TextEditingController(text: "");

  @override
  void dispose() {
    _addressTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    // ignore: unused_local_variable
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Hi, ',
                    style: const TextStyle(
                        color: Colors.cyan,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'My Name',
                        style: TextStyle(
                            color: color,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                        //recognizer
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('Tap Here onTap');
                          },
                      )
                    ],
                  ),
                ),
                //add sized box
                const SizedBox(
                  height: 5,
                ),
                TextWidget(text: 'test1@gmail.com', color: color, textSize: 20),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 20,
                ),

                _listTiles(
                  title: 'Address2',
                  subtitle: 'testing',
                  icon: IconlyLight.profile,
                  onPressed: () async {
                    await _showAddressDialog();
                  },
                  color: color,
                ),
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
                  title: TextWidget(
                      text:
                          themeState.getDarkTheme ? 'Dark Mode' : 'Light Mode',
                      color: color,
                      textSize: 20),
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
                  onPressed: () {
                    _showLogoutDialog();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showLogoutDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Image.asset(
                  'assets/images/warning-sign.png',
                  height: 20,
                  width: 20,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text('Sign Out'),
              ],
            ),
            content: const Text('Do you want to sign out?'),
            actions: [
              TextButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: TextWidget(
                  color: Colors.cyan,
                  text: 'Cancel',
                  textSize: 18,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: TextWidget(
                  color: Colors.red,
                  text: 'OK',
                  textSize: 18,
                ),
              ),
            ],
          );
        });
  }

  Future<void> _showAddressDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Update'),
            content: TextField(
              onChanged: (value) {
                //_addressTextController.text;
                print(
                    '_adressTextController.text: ${_addressTextController.text}');
              },
              controller: _addressTextController,
              maxLength: 5,
              decoration: const InputDecoration(hintText: 'Your Address'),
            ),
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text('Update'),
              )
            ],
          );
        });
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
        onPressed();
      },
    );
  }
}
