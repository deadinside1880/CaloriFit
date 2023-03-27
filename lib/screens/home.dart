import 'package:calori_fit/Widgets/CaloriFitTitle.dart';
import 'package:calori_fit/screens/profilescreen.dart';
import 'package:calori_fit/styles/Colors.dart';
import 'package:flutter/material.dart';


import 'achievementscreen.dart';
import 'homescreen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String photoURL = "";
  late List<Widget> homescreens;
  int _page = 0;
  late PageController _pageController;

  void pageTapped(int page){
    _pageController.jumpToPage(page);
  }

  void onPageChanged(int page){
    setState(() {
      _page = page;
    });
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
    homescreens = [const HomeScreen(), AchievementScreen(photoURL: photoURL), const Text("Notifications"), const ProfileScreen(),];
  }

  @override
  void dispose(){
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: backgroundcolor,
        title: const CaloriFitTitle(color: Colors.white),
        centerTitle: true,
        shadowColor: Colors.transparent,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: homescreens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1C1C1E),
        currentIndex: _page,
        iconSize: 28,
        showSelectedLabels: false,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded, 
            color: _page == 0? Colors.white : const Color(0xFF505050),
            ), 
            label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_rounded,
            color: _page == 1? Colors.white : const Color(0xFF505050)
            ), 
            label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, 
            color: _page == 2? Colors.white : const Color(0xFF505050),
            ), 
            label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, 
            color: _page == 3? Colors.white : const Color(0xFF505050),
            ), 
            label: ''),
        ],
        onTap: pageTapped,
      ),
    );
  }
}