import 'package:code_union/app/ui/screens/main/favorites/favorites_screen.dart';
import 'package:code_union/app/ui/screens/main/home/home_screen.dart';
import 'package:code_union/app/ui/screens/main/map/map_screen.dart';
import 'package:code_union/app/ui/screens/main/profile/profile_screen.dart';
import 'package:code_union/app/ui/screens/main/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [
          HomeScreen(),
          MapScreen(),
          FavoritesScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: CUBottomNavigationBar(
        pageController: _pageController,
      ),
    );
  }
}
