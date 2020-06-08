import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: HomeWidget(),
    );
  }
}

class HomeWidget extends StatefulWidget {
  HomeWidget({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _selectedIndex = 0;
  bool showNavigationBar = false;

  var list = [
    HomePage(),
    WalkPage(),
    LocationPage(),
    NotificationPage(),
    SettingsPage(),
    SearchPage()
  ];

  var title = [
    "HomePage",
    'WalkPage',
    'LocationPage',
    'NotificationPage',
    'SettingsPage',
    'SearchPage'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title[_selectedIndex]),
        centerTitle: false,
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                showNavigationBar = !showNavigationBar;
              });
            }),
      ),
      body: Container(
        child: SafeArea(
            child: Stack(
              children: <Widget>[
                list[_selectedIndex],
                Positioned(
                  top: 0,
                  left: 0,
                  child: Visibility(
                    visible: showNavigationBar,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: NavigationRail(
                        selectedIndex: _selectedIndex,
                        elevation: 10,
                        backgroundColor: Colors.white,
                        leading: Container(
                          child: Center(child: Text('leading')),
                        ),
                        trailing: Container(
                          child: Center(child: Text('trailing')),
                        ),
                        selectedIconTheme: IconThemeData(color: Colors.purple, size: 30),
                        unselectedIconTheme: IconThemeData(color: Colors.grey, size: 20),
                        selectedLabelTextStyle:
                        TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
                        unselectedLabelTextStyle:
                        TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
                        onDestinationSelected: (int index) {
                          setState(() {
                            _selectedIndex = index;
                            showNavigationBar = !showNavigationBar;
                          });
                        },
                        labelType: NavigationRailLabelType.none,
                        destinations: [
                          NavigationRailDestination(
                            icon: Icon(Icons.home),
                            selectedIcon: Icon(Icons.home),
                            label: Text('Home'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.directions_walk),
                            selectedIcon: Icon(Icons.directions_walk),
                            label: Text('Walk'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.location_on),
                            selectedIcon: Icon(Icons.location_on),
                            label: Text('Location'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.notifications),
                            selectedIcon: Icon(Icons.notifications),
                            label: Text('Notifications'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.settings),
                            selectedIcon: Icon(Icons.settings),
                            label: Text('Settings'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.search),
                            selectedIcon: Icon(Icons.search),
                            label: Text('Search'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
          child: Text('Home Page',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0))),
    );
  }
}

class WalkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
          child: Text('Walk Page',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0))),
    );
  }
}

class LocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Center(
          child: Text('Location Page',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0))),
    );
  }
}

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(
          child: Text('Notification Page',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0))),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Center(
          child: Text('Settings Page',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0))),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Center(
          child: Text('Search Page',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0))),
    );
  }
}
