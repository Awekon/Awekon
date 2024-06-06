import 'package:awekon/components/ui_components/CustomAppBar/CustomSilverAppBar.dart';
import 'package:awekon/components/ui_components/CustomButton/CustomGradientButton.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProfilePageApp extends StatelessWidget {
  const ProfilePageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          const CustomSliverAppBar(title: Text("Profile")),
        ];
      },
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildProfileHeader(),
              _buildProfileStats(),
              _buildDailyGoal(),
              _buildOptions(),
              _buildContentTabs(),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          ClipOval(
            child: Image.network(
              'https://source.unsplash.com/random',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return const Icon(
                  Icons.account_circle,
                  size: 100,
                  color: Colors.grey,
                );
              },
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return SizedBox(
                  width: 100,
                  height: 100,
                  child: Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'User Name',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Short bio about the user goes here.',
                ),
                const SizedBox(height: 8),
                CustomGradientButton(
                    child: const Text("Edit Profile"),
                    onPressed: () {
                      if (kDebugMode) {
                        print("Edit Profile pressed!");
                      }
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileStats() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatColumn('Stories', '20'),
          _buildStatColumn('Followers', '150'),
          _buildStatColumn('Following', '180'),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String label, String count) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildDailyGoal() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Set Daily Goal',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Daily Goal (minutes)',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 8),
              CustomGradientButton(
                  child: const Text("Set Goal"),
                  onPressed: () {
                    print("Set Goal pressed!");
                  })
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOptions() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Options',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            trailing: Switch(
              value: true,
              onChanged: (value) {
                // Handle notification toggle
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Privacy Settings'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle navigation to privacy settings
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Language'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle navigation to language settings
            },
          ),
        ],
      ),
    );
  }

  Widget _buildContentTabs() {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.audiotrack), text: 'Audio Stories'),
              Tab(icon: Icon(Icons.videocam), text: 'Video Stories'),
            ],
          ),
          SizedBox(
            height: 400,
            child: TabBarView(
              children: [
                _buildStoryList('audio'),
                _buildStoryList('video'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoryList(String type) {
    List<String> stories = List.generate(10, (index) => 'Story ${index + 1}');

    return ListView.builder(
      itemCount: stories.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(type == 'audio' ? Icons.audiotrack : Icons.videocam),
          title: Text(stories[index]),
          onTap: () {
            // Handle story tap
          },
        );
      },
    );
  }
}
