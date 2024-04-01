import 'package:flutter/material.dart';
import '../views/3-home.dart';
import '../views/4-bookmark.dart';


class Dash extends StatefulWidget {
  const Dash({Key? key}) : super(key: key);

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> {
  int _current = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: IndexedStack(
        index: _current,
        children: [
          Container(),//profile
          Container(),//trending
          Container(),//search
          BookMark(),//bookmark
          Home(),//home
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
            canvasColor: Colors.black,
            ),
        child: BottomNavigationBar(



            currentIndex: _current,
            onTap: (idx) => setState(() {
              _current = idx;
            }),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,

            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.trending_up), label: "Trending"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: "Search"),

              BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark), label: "Bookmark"),

              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "Home"),
            ]),
      ),
    );
  }
}
