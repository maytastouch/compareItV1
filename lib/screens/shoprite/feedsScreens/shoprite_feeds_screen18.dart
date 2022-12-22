import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:udemy/screens/shoprite/shoprite_feeds_item.dart';

import '../../../appColors/colors.dart';
import '../../../services/utils.dart';

import '../../../widgets/text_widget.dart';

class ShopriteFeedsScreen18 extends StatefulWidget {
  static const routeName = "/FeedsScreenState";

  const ShopriteFeedsScreen18({super.key});

  @override
  State<ShopriteFeedsScreen18> createState() => _ShopriteFeedsScreenState();
}

class _ShopriteFeedsScreenState extends State<ShopriteFeedsScreen18> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchTextFocusNode = FocusNode();

  @override
  void dispose() {
    _searchController!.dispose();
    _searchTextFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          text: 'Home and Outdoor',
          color: color,
          textSize: 20,
          isTitle: true,
        ),
        elevation: 0,
        leading: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            IconlyLight.arrowLeft2,
            color: color,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 20),
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
            child: SingleChildScrollView(
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                //crossAxisSpacing: 10,
                childAspectRatio: size.width / (size.height * 0.55),
                children: List.generate(10, (index) {
                  return ShopriteFeedsWidget();
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//shoprite_feeds_screen13.dart