import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:zoya/screens/views/featured_articles.dart';
import 'package:zoya/shared/moods.dart';
import 'package:zoya/shared/utils.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    Positioned _moodsHolder() {
      return Positioned(
        bottom: -45,
        child: Container(
          height: 100.0,
          width: MediaQuery.of(context).size.width - 40,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(28)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 5.5,
                blurRadius: 5.5,
              )
            ],
          ),
          child: MoodsSelector(),
        ),
      );
    }

    Container _backBgCover() {
      return Container(
        height: 260.0,
        decoration: BoxDecoration(
          gradient: purpleGradient,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
      );
    }

    Positioned _greetings() {
      return Positioned(
        left: 20,
        bottom: 90,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Hi Dan',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'How are you feeling today ?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
            ),
            Flexible(
              fit: FlexFit.loose,
              child: CircleAvatar(
                backgroundImage:
                    AssetImage("assets/images/ic_launcher_round-web.png"),
                radius: 35.0,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: mainBgColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              fit: StackFit.loose,
              alignment: AlignmentDirectional.topCenter,
              overflow: Overflow.visible,
              children: [
                _backBgCover(),
                _greetings(),
                _moodsHolder(),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            FeaturedArticleView(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[50],
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.black,
        iconSize: MediaQuery.of(context).size.width * 0.07,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? Icon(Ionicons.cart)
                : Icon(Ionicons.cart_outline),
            title: Text('Activities'),
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? Icon(Ionicons.image)
                : Icon(Ionicons.image_outline),
            title: Text('Moments'),
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? Icon(Ionicons.home)
                : Icon(Ionicons.home_outline),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? Icon(Ionicons.search)
                : Icon(Ionicons.search_outline),
            title: Text('Chat'),
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 4
                ? Icon(Ionicons.menu)
                : Icon(Ionicons.menu_outline),
            title: Text('Settings'),
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
