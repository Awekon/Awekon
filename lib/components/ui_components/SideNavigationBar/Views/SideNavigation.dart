import 'package:awekon/screens/Profile/Views/ProfilePage.dart';
import 'package:flutter/material.dart';

class SideNavigationDrawer extends StatelessWidget {
  const SideNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: const SizedBox(
                    height: 60,
                    width: 60,
                    child: Image(
                      image: AssetImage("assets/images/profile_icon.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Jonny Sins",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Text(
                        "jonny.sins@example.com",
                        style: TextStyle(color: Colors.white70),
                        overflow: TextOverflow.ellipsis,
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle switch account
                        },
                        child: const Text(
                          'Switch Account',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  leading: const Icon(Icons.account_circle),
                  title: const Text('Profile'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilePage()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  onTap: () {
                    // Navigate to Settings
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.notifications),
                  title: const Text('Notifications'),
                  onTap: () {
                    // Navigate to Notifications
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.bookmark),
                  title: const Text('Bookmarks'),
                  onTap: () {
                    // Navigate to Bookmarks
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.help),
                  title: const Text('Help & Feedback'),
                  onTap: () {
                    // Navigate to Help & Feedback
                  },
                ),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // Handle logout
            },
          ),
        ],
      ),
    );
  }
}
