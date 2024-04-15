import 'package:flutter/material.dart';
import 'package:form/Views/log_in.dart';
import 'package:form/Views/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavBar extends StatefulWidget {
  NavBar({super.key});
  @override
  State<NavBar> createState() => _NavBar();
}

class _NavBar extends State<NavBar> {
  var arrIcons = [
    Icon(Icons.favorite),
    Icon(Icons.people),
    Icon(Icons.share),
    Icon(Icons.notifications)
  ];

  var arrIcons2 = [
    Icon(Icons.settings),
    Icon(Icons.description),
  ];

  var arrTitle = ['Favorites', 'Freinds', 'Share', 'Requests'];
  var arrTitle2 = [
    'Settings',
    'Policies',
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Drawer(
      width: screenWidth * .6,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Siyaram', style: TextStyle(fontSize: 20)),
            accountEmail:
                Text('Siyaram@gmail.com', style: TextStyle(fontSize: 15)),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/user_image.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage('assets/images/bg_image.jpg'),
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            height: arrIcons.length * 50,
            child: ListView.builder(
              itemBuilder: ((context, index) {
                return ListTile(
                  leading: arrIcons[index],
                  title: Text(
                    "${arrTitle[index]}",
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () => null,
                );
              }),
              itemCount: arrIcons.length,
            ),
          ),
          Divider(),
          SizedBox(
            height: arrIcons2.length * 50,
            child: ListView.builder(
              itemBuilder: ((context, index) {
                return ListTile(
                  leading: arrIcons2[index],
                  title: Text(
                    "${arrTitle2[index]}",
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () => null,
                );
              }),
              itemCount: arrIcons2.length,
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'LogOut',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(
                    'Want to exit',
                    style: TextStyle(fontSize: 25),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'No',
                          style: TextStyle(fontSize: 20),
                        )),
                    TextButton(
                        onPressed: () async {
                          var prefs = await SharedPreferences.getInstance();
                          prefs.setBool(SplashScreenState.KEYLOG, false);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LogIn(),
                              ));
                        },
                        child: Text('Yes', style: TextStyle(fontSize: 20))),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
