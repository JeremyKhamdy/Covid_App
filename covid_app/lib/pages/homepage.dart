import 'package:covid_app/pages/components/french.dart';
import 'package:covid_app/pages/components/world.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    BodyWorld(),
    BodyFrench()
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("COVID APP", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
      body: _widgetOptions.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        showUnselectedLabels: true,
        currentIndex: currentIndex,
        backgroundColor: Colors.black,
        onTap: (int index){
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.flag), label: "Monde"),
          BottomNavigationBarItem(icon: Icon(Icons.flag), label: "France"),
        ],
      ),
    );
  }
}
