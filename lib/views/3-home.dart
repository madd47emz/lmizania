import 'package:flutter/material.dart';
import '../views/3a-notifications.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late final TabController _tabController;

  int _selectedIndex = 3;
  static List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: about us',
    ),
    Text(
      'Index 1: Contact',
    ),
    Text(
      'Index 2: Author service',
    ),
    ListView(
      children: [
        Container(
          color: Colors.white,
          width: double.infinity,
          height: 150,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/4.png",),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("إقرأ, نحو الأفق الجميل",style: TextStyle(fontFamily: 'Riwaya',color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20),),
                    Text("إكتشف مجموعة من أفضل الكتب \nفي مختلف المواضيع و المجالات",style: TextStyle(fontFamily: 'Riwaya',color: Colors.black38)),
                    ElevatedButton(onPressed: (){}, child: Text("إشترك و إقرأ مجانا لي ثلاثين يوما",style: TextStyle(fontFamily: 'Riwaya',color: Colors.black,),)),
                    Text("يمكنك إلغاء الإشتراك في أي وقت",style: TextStyle(fontFamily: 'Riwaya',color: Colors.black38)),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFF242424),
      appBar: AppBar(
        backgroundColor: Color(0xFF242424),
        elevation: 0,
        title: Center(
          child: Text(
            "قبس",
            style: TextStyle(fontFamily: 'Riwaya', fontSize: 40),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Notifications()));
            },
            icon: Icon(
              Icons.notifications
            ),
          )
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.black.withOpacity(0.5),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                "قبس",
                style: TextStyle(fontFamily: 'Riwaya', fontSize: 50,color: Colors.white),
              ),
            ),
            SizedBox(height: 20,),
            ListTile(
              title: Center(
                child: Text(
                  "تصفح",
                  style: TextStyle(fontFamily: 'Riwaya', fontSize: 20,color: Colors.white),
                ),
              ),
              selected: _selectedIndex == 3,
              onTap: () {
                _onItemTapped(3);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Center(
                child: Text(
                  "من نحن",
                  style: TextStyle(
                    fontFamily: 'Riwaya',fontSize: 20,color: Colors.white
                  ),
                ),
              ),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Center(
                child: Text(
                  "تواصل معنا",
                  style: TextStyle(fontFamily: 'Riwaya',fontSize: 20,color: Colors.white),
                ),
              ),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Center(
                child: Text(
                  "خدمة المؤلفين",
                  style: TextStyle(fontFamily: 'Riwaya',fontSize: 20,color: Colors.white),
                ),
              ),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _widgetOptions[_selectedIndex],
    ));
  }
}
