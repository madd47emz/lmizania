import 'package:flutter/material.dart';
import 'package:lmizania/views/4-wallet.dart';
import 'package:lmizania/views/5-stats.dart';
import 'package:lmizania/views/6-settings.dart';
import 'package:lmizania/views/res/colors.dart';
import '../views/3-home.dart';


class Dash extends StatefulWidget {
  const Dash({Key? key}) : super(key: key);

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: IndexedStack(
        index: _current,
        children: [
          Home(),//home
          Wallet(),//wallet
          Statistics(),//statistics
          Settings(),//settings
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: mainColor,
            ),
        child: BottomNavigationBar(



            currentIndex: _current,
            onTap: (idx) => setState(() {
              _current = idx;
            }),
            showSelectedLabels: true,
            showUnselectedLabels: false,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withOpacity(0.8),

            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.wallet), label: "Wallet"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bar_chart), label: "Statistics"),

              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "Settings"),
            ]),
      ),
    );
  }
}
