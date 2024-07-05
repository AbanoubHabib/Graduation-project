import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
  body:  Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/img/test.jpg"),
                        fit: BoxFit.cover),
                  ),
                  currentAccountPicture: CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage("assets/img/ali.jpg")),
                  accountEmail: Text("ali@yahoo.com"),
                  accountName: Text("Ali Hassan",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
                ListTile(
                    title: Text("Home"),
                    leading: Icon(Icons.home),
                    onTap: () {
                      _onItemTapped(0);
                      Navigator.pop(context);
                    }),
                ListTile(
                    title: Text("My Products"),
                    leading: Icon(Icons.add_shopping_cart),
                    onTap: () {
                      _onItemTapped(1);
                      Navigator.pop(context);
                    }),
                ListTile(
                    title: Text("Profile"),
                    leading: Icon(Icons.person),
                    onTap: () {
                      _onItemTapped(2);
                      Navigator.pop(context);
                    }),
                ListTile(
                    title: Text("Logout"),
                    leading: Icon(Icons.exit_to_app),
                    onTap: () {
                      _onItemTapped(3);
                      Navigator.pop(context);
                    }),
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 12),
              child: Text("Developed by Ali Hassan © 2022",
                  style: TextStyle(fontSize: 16)),
            )
          ],
        ),
      ),
    );
  }
}


