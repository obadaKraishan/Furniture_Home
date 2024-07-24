import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../widgets/carousel_slider_widget.dart';
import '../widgets/trending_list_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();

  int _bottomNavIndex = 0;

  final List<Map<String, String>> imgList = [
    {'image': 'assets/category1.png', 'name': 'Category 1'},
    {'image': 'assets/category1.png', 'name': 'Category 2'},
    {'image': 'assets/category1.png', 'name': 'Category 3'},
  ];

  final List<String> trendingList = [
    'assets/trending1.png',
    'assets/trending2.png',
    'assets/trending3.png',
    'assets/trending1.png',
    'assets/trending2.png',
    'assets/trending3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Colors.grey,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: SafeArea(
        child: Container(
          color: Colors.white, // Set drawer background color to white
          child: ListTileTheme(
            textColor: Colors.black, // Set text color to black
            iconColor: Colors.black, // Set icon color to black
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(height: 24.0),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home', style: TextStyle(fontFamily: 'Oswald', fontWeight: FontWeight.w400)),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.account_circle_rounded),
                  title: Text('Profile', style: TextStyle(fontFamily: 'Oswald', fontWeight: FontWeight.w400)),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings', style: TextStyle(fontFamily: 'Oswald', fontWeight: FontWeight.w400)),
                  onTap: () {},
                ),
                Spacer(),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                    fontFamily: 'Oswald',
                    fontWeight: FontWeight.w300,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Text('Terms of Service | Privacy Policy'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Color(0xFF474749),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Discover',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _advancedDrawerController.showDrawer(),
                    child: Icon(Icons.menu, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 16),
              CarouselSliderWidget(imgList: imgList),
              SizedBox(height: 16),
              Text(
                'Trending',
                style: TextStyle(
                  fontFamily: 'Oswald',
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TrendingListWidget(trendingList: trendingList),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: SalomonBottomBar(
            currentIndex: _bottomNavIndex,
            onTap: (index) => setState(() => _bottomNavIndex = index),
            items: [
              SalomonBottomBarItem(
                icon: Icon(Icons.home),
                title: Text("Home"),
                selectedColor: Colors.grey.shade700,
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.favorite),
                title: Text("Likes"),
                selectedColor: Colors.pink,
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.shopping_cart),
                title: Text("Cart"),
                selectedColor: Colors.orange,
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.search),
                title: Text("Search"),
                selectedColor: Colors.teal,
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.person),
                title: Text("Profile"),
                selectedColor: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
