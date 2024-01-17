import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:second_choice_flutter/views/widgets/Fav_page.dart';
import 'package:second_choice_flutter/views/widgets/home_page.dart';
import '../widgets/settings_view.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentSelectedIndex = 0;
  final PageController _pageController = PageController();
  final List<Widget> _pages = [
    const ProductList(),
    FavPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      extendBody: true,
      body: PageView(
        children: _pages,
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentSelectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: DotNavigationBar(
        backgroundColor: Colors.black54,
        splashColor: Colors.white10,
        selectedItemColor: Colors.white,
        dotIndicatorColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        items: [
          DotNavigationBarItem(icon: const Icon(Icons.home)),
          DotNavigationBarItem(icon: const Icon(Icons.favorite)),
          DotNavigationBarItem(icon: const Icon(Icons.settings)),
        ],
        currentIndex: _currentSelectedIndex,
        onTap: (index) {
          setState(() {
            _currentSelectedIndex = index;
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          });
        },
      ),
    );
  }
}
