import 'package:bookstore/view/home_view.dart';
import 'package:bookstore/view/library_view.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _currentIndex = 0;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      _tabController.index = _currentIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        physics:
            const NeverScrollableScrollPhysics(), // Disable swiping between tabs
        children: [
          const HomeView(),
          LibraryView(),
          Scaffold(
            appBar: AppBar(
              title: const Text('Tab 3'),
            ),
            body: const Center(
              child: Text('Tab 3 content'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.home_12_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.library_16_filled),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.list_16_filled),
            label: 'Wishlist',
          ),
        ],
      ),
    );
  }
}
