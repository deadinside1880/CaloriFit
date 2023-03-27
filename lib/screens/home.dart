import 'package:calori_fit/Widgets/CaloriFitTitle.dart';
import 'package:calori_fit/Widgets/Loader.dart';
import 'package:calori_fit/resources/providers.dart';
import 'package:calori_fit/screens/profilescreen.dart';
import 'package:calori_fit/styles/Colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  bool isLoading = true;

  void pageTapped(int page) {
    _pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void setUser(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    if(context.mounted){
      context.read<Providers>().refreshUser();
    }
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      isLoading = false;
      homescreens = [
        const HomeScreen(),
        const AchievementScreen(),
        const ProfileScreen(),
      ];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    setUser(context);
    super.initState();
    _pageController = PageController();
    homescreens = [
      const HomeScreen(),
      const AchievementScreen(),
      const ProfileScreen(),
    ];
  }

  @override
  void dispose() {
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
        centerTitle: true,
        shadowColor: Colors.transparent,
      ),
      body: isLoading
          ? const Loader()
          : PageView(
              controller: _pageController,
              onPageChanged: onPageChanged,
              children: homescreens,
            ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1C1C1E),
        currentIndex: _page,
        items: [
          BottomNavigationBarItem(
              icon: SizedBox(
                  height: 50,
                  child: Icon(
                    Icons.home_rounded,
                    size: 30,
                    color: _page == 0 ? Colors.white : const Color(0xFF505050),
                  )),
              label: ''),
          BottomNavigationBarItem(
              icon: SizedBox(
                height: 50,
                child: Icon(Icons.bar_chart_rounded,
                    size: 30,
                    color: _page == 1 ? Colors.white : const Color(0xFF505050)),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: SizedBox(
                height: 50,
                child: Icon(
                  Icons.person,
                  size: 30,
                  color: _page == 2 ? Colors.white : const Color(0xFF505050),
                ),
              ),
              label: ''),
        ],
        onTap: pageTapped,
      ),
    );
  }
}
