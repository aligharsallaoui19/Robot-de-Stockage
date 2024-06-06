import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:storage_robot/components/my_drawer_tile.dart';
import 'package:storage_robot/screens/colour_screen.dart';
import 'package:storage_robot/screens/control_screen.dart';
import 'package:storage_robot/screens/distance_screen.dart';
import 'package:storage_robot/screens/history_screen.dart';
import 'package:storage_robot/screens/settings_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  // logout user
  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // app logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.android_sharp,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          // home list tile
          MyDrawerTile(
            icon: Icons.home,
            title: "H O M E",
            onTap: () {
              // This is already home screen so just pop drawer
              Navigator.pop(context);
            },
          ),

          // control robot list tile
          MyDrawerTile(
            icon: Icons.control_camera,
            title: "C O N T R O L",
            onTap: () {
              // pop drawer
              Navigator.pop(context);
              // navigate to profile screen
              Navigator.pushNamed(context, ControlScreen.screenId);
            },
          ),

          // history list tile
          MyDrawerTile(
            icon: Icons.history,
            title: "H I S T O R Y",
            onTap: () {
              // pop drawer
              Navigator.pop(context);
              // navigate to profile screen
              Navigator.pushNamed(context, HistoryScreen.screenId);
            },
          ),

          MyDrawerTile(
            icon: Icons.speed,
            title: "D I S T A N C E",
            onTap: () {
              // pop drawer
              Navigator.pop(context);
              // navigate to profile screen
              Navigator.pushNamed(context, DistanceScreen.screenId);
            },
          ),

          MyDrawerTile(
            icon: Icons.color_lens_outlined,
            title: "C O L O U R",
            onTap: () {
              // pop drawer
              Navigator.pop(context);
              // navigate to profile screen
              Navigator.pushNamed(context, ColourScreen.screenId);
            },
          ),

          // settings list tile
          MyDrawerTile(
            icon: Icons.settings,
            title: "S E T T I N G S",
            onTap: () {
              // pop drawer
              Navigator.pop(context);
              // navigate to profile screen
              Navigator.pushNamed(context, SettingsScreen.screenId);
            },
          ),

          const Spacer(),

          // logout list tile
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyDrawerTile(
              icon: Icons.logout,
              title: "L O G O U T",
              onTap: () {
                // pop drawer
                Navigator.pop(context);

                // logout
                logout();
              },
            ),
          ),
        ],
      ),
    );
  }
}
