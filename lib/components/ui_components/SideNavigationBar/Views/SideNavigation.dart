import 'package:awekon/core/constants/SystemNavigationConstant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideNavigationDrawer extends StatelessWidget {
  const SideNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 0.1 * MediaQuery.of(context).size.width,
                    backgroundImage: const NetworkImage(
                      'https://source.unsplash.com/person',
                    ),
                    onBackgroundImageError:
                        (Object error, StackTrace? stackTrace) {
                      // Handle image loading error
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Jonny Sins",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        const Text("Awekonier")
                      ],
                    ),
                  )
                ],
              )
            ],
          )),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Profile'),
            onTap: () {
              Get.toNamed(profileRoute);
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
