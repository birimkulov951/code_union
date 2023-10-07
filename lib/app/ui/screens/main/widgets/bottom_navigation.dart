import 'package:code_union_localization/strings.g.dart';
import 'package:flutter/material.dart';

class CUBottomNavigationBar extends StatefulWidget {
  const CUBottomNavigationBar({
    required this.pageController,
    super.key,
  });

  final PageController pageController;

  @override
  State<CUBottomNavigationBar> createState() => CUBottomNavigationBarState();
}

class CUBottomNavigationBarState extends State<CUBottomNavigationBar> {
  var _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentPageIndex,
      onTap: (index) {
        widget.pageController.jumpToPage(index);
        setState(() {
          _currentPageIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: context.t.main.tabs.home,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.map),
          label: context.t.main.tabs.map,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.heart_broken),
          label: context.t.main.tabs.favorites,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: context.t.main.tabs.profile,
        ),
      ],
    );
  }
}
