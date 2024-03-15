import 'package:apilogin/components/my_drawer_tile.dart';
import 'package:apilogin/pages/settings_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 25),
            // app logo
            Icon(
              Icons.local_activity,
              size: 55,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Divider(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),

            // home list tile
            MyDrawerTile(
              text: 'H O M E',
              icon: Icons.home,
              onTap: () => Navigator.pop(context),
            ),

            // settings list tile
            MyDrawerTile(
              text: 'S E T T I N G S',
              icon: Icons.settings,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              },
            ),

            const Spacer(),

            // logout list tile
            MyDrawerTile(
              text: 'L O G O U T',
              icon: Icons.logout,
              onTap: () {
                Navigator.pop(context);
                // fill in the logout logic here
                // Navigator.push(context, route)
              },
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
