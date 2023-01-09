import 'package:flutter/material.dart';
import 'package:schoolmanagement/custom_widgets/colors.dart';

class TrackingPage extends StatefulWidget {
  TrackingPage({super.key});

  @override
  State<TrackingPage> createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
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
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                showNavigationBar = !showNavigationBar;
              });
            }),
      ),
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          list[_selectedIndex],
          Positioned(
            top: 0,
            left: 0,
            child: Visibility(
              visible: showNavigationBar,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: NavigationRail(
                  selectedIndex: _selectedIndex,
                  elevation: 10,
                  backgroundColor: Colors.white,
                  selectedIconTheme:
                      const IconThemeData(color: Colors.purple, size: 30),
                  unselectedIconTheme:
                      const IconThemeData(color: Colors.grey, size: 20),
                  selectedLabelTextStyle: const TextStyle(
                      color: Colors.purple, fontWeight: FontWeight.bold),
                  unselectedLabelTextStyle: const TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.normal),
                  onDestinationSelected: (int index) {
                    setState(() {
                      _selectedIndex = index;
                      showNavigationBar = !showNavigationBar;
                    });
                  },
                  labelType: NavigationRailLabelType.none,
                  destinations: [
                    const NavigationRailDestination(
                      icon: Icon(Icons.home),
                      selectedIcon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    const NavigationRailDestination(
                      icon: Icon(Icons.directions_walk),
                      selectedIcon: Icon(Icons.directions_walk),
                      label: Text('Walk'),
                    ),
                    const NavigationRailDestination(
                      icon: Icon(Icons.location_on),
                      selectedIcon: Icon(Icons.location_on),
                      label: Text('Location'),
                    ),
                    const NavigationRailDestination(
                      icon: Icon(Icons.notifications),
                      selectedIcon: Icon(Icons.notifications),
                      label: Text('Notifications'),
                    ),
                    const NavigationRailDestination(
                      icon: Icon(Icons.settings),
                      selectedIcon: Icon(Icons.settings),
                      label: Text('Settings'),
                    ),
                    const NavigationRailDestination(
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
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        child: GridView.builder(
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: kLightBlueColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(child: Text(index.toString())),
                ),
              );
            }));
  }
}

class WalkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListTile(
            leading: Hero(
              tag: 'hero-rectangle',
              child: BoxWidget(size: Size(50.0, 50.0)),
            ),
            onTap: () => _gotoDetailsPage(context),
            title: const Text(
              'Tap on the icon to view hero animation transition.',
            ),
          )
        ],
      ),
    );
  }

  void _gotoDetailsPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Second Page'),
        ),
        body: Center(
          child: Hero(
            tag: 'hero-rectangle',
            child: BoxWidget(
              name: "vivek",
              size: const Size(200.0, 200.0),
            ),
          ),
        ),
      ),
    ));
  }
}

class BoxWidget extends StatelessWidget {
  String? name;
  BoxWidget({this.name, super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size.width,
        height: size.height,
        color: Colors.blue,
        child: Center(child: Text(name.toString())));
  }
}

class LocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: const Center(
          child: Text('Location Page',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0))),
    );
  }
}

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: const Center(
          child: Text('Notification Page',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0))),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: const Center(
          child: Text('Settings Page',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0))),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: const Center(
          child: Text('Search Page',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0))),
    );
  }
}
