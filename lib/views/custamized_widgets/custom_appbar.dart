import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/favourite_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomAppBar({
    Key? key,
    required this.scaffoldKey,
    required this.preferredSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
IconButton(onPressed: () {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return View_favourites();
  },));
}, icon: Icon(Icons.favorite_sharp))      ],
      leading: Builder(
        builder: (context) => IconButton(
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
          icon: Icon(Icons.menu),
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Tell us your dream",
            hintStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      
    );
  }

  @override
  final Size preferredSize;
}
