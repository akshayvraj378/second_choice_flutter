import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo[100],
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Danial Disooza',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 10),
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
              ],
            ),
          ),
          buildListTile(
            icon: Icons.home,
            iconColor: Colors.green[100],
            title: 'Home',
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
            },
          ),
          buildListTile(
            icon: Icons.settings,
            iconColor: Colors.brown[100],
            title: 'Settings',
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => Seti(),));
            },
          ),
          buildListTile(
            icon: Icons.person,
            iconColor: Colors.blueAccent[100],
            title: 'Profile',
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => Seti(),));
            },
          ),
          buildListTile(
            icon: Icons.privacy_tip_outlined,
            iconColor: Colors.red[100],
            title: 'About Us',
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => Seti(),));
            },
          ),
          buildListTile(
            icon: Icons.star_border_rounded,
            iconColor: Colors.amber[200],
            title: 'Share your experience',
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => Seti(),));
            },
          ),
          buildListTile(
            icon: Icons.live_help_outlined,
            iconColor: Colors.purple[100],
            title: 'Help line',
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => Seti(),));
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, top: 90),
            child: TextButton.icon(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.teal),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
              ),
              icon: const Icon(Icons.login_outlined, color: Colors.white),
              label: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildListTile({
    required IconData icon,
    required Color? iconColor,
    required String title,
    required Function onTap,
  }) {
    return ListTile(
      onTap: () => onTap(),
      leading: Icon(icon, color: iconColor, size: 30),
      title: Text(
        title,
        style: TextStyle(color: Colors.black, fontSize: 17),
      ),
    );
  }
}
