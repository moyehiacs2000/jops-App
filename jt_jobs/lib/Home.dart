//@dart=2.9
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:jt_jobs/Profile.dart';
import 'package:jt_jobs/applications.dart';
import 'package:jt_jobs/DashBoardScreen/dashboard.dart';
import 'package:jt_jobs/search_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  PageController _pageController;
  final PageStorageBucket bucket = PageStorageBucket();
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _selectedIndex = index);
          },
          children: <Widget>[
            DashBoard(),
            Applications(),
            SearchScreen(),
            Profile(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        showElevation: true,
        onItemSelected: _onItemTapped,
        items: [
          BottomNavyBarItem(
              icon: Icon(Icons.dashboard_outlined),
              title: Text('Dashboard'),
              inactiveColor: Colors.grey,
              activeColor: Color.fromRGBO(113, 40, 220, 1)),
          BottomNavyBarItem(
              icon: Icon(Icons.apps_outlined),
              title: Text('Applications'),
              inactiveColor: Colors.grey,
              activeColor: Color.fromRGBO(113, 40, 220, 1)),
          BottomNavyBarItem(
              icon: Icon(Icons.search_outlined),
              title: Text('Search'),
              inactiveColor: Colors.grey,
              activeColor: Color.fromRGBO(113, 40, 220, 1)),
          BottomNavyBarItem(
              icon: Icon(Icons.person_outline),
              title: Text('Profile  '),
              inactiveColor: Colors.grey,
              activeColor: Color.fromRGBO(113, 40, 220, 1)),
        ],
      ),
      drawer: Drawer(),
    );
  }
}
