import 'package:awekon/components/ui_components/Custom%20Card/Views/CustomCard.dart';
import 'package:awekon/components/ui_components/ForyouListView/Views/ForyouListView.dart';
import 'package:awekon/core/constants/font_size.dart';
import 'package:awekon/data/Remote/Repository/YoutubeDataFetchRepository.dart';
import 'package:awekon/screens/Home/Bloc/youtube_bloc.dart';
import 'package:awekon/screens/Home/Bloc/youtube_state.dart';
import 'package:awekon/screens/VideoPlayerScreen/Views/VideoPlayerScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/ui_components/Trending Carousel/Views/carousel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late YoutubeCubit _youtubeCubit;
  final ScrollController _scrollController = ScrollController();
  late String? pagetoken;
  final String query = "random";

  @override
  void initState() {
    super.initState();
    // Initialize the YoutubeCubit and call the fetch function with a random query
    _youtubeCubit = YoutubeCubit(YouTubeRepository());
    _youtubeCubit.fetchYoutubeVideos(query); // Pass any random query here

    // Listen for scroll events
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.extentAfter < 100) {
      // Load more data when reaching the end of the list
      _youtubeCubit.fetchmoreYoutubeVideos(query, pagetoken!);
    }
  }

  @override
  void dispose() {
    // Dispose of the cubit and scroll controller when the widget is disposed to prevent memory leaks
    _youtubeCubit.close();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ForYouListView(), // Adding the For You list view here
            SizedBox(height: 0.02 * MediaQuery.of(context).size.height),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                children: [
                  Text(
                    "Trending",
                    style: TextStyle(fontSize: FontSize.large),
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.trending_up_outlined),
                ],
              ),
            ),
            SizedBox(height: 0.01 * MediaQuery.of(context).size.height),
            Center(child: TrendingCarousel()),
            SizedBox(height: 0.01 * MediaQuery.of(context).size.height),
            BlocProvider(
              create: (context) => _youtubeCubit,
              child: BlocBuilder<YoutubeCubit, YoutubeState>(
                // Provide YoutubeState here
                builder: (context, state) {
                  if (state is YoutubeLoading) {
                    return const CircularProgressIndicator(); // Show loading indicator while fetching data for the first time
                  } else if (state is YoutubeLoaded ||
                      state is YoutubeLoadingMore) {
                    pagetoken = state is YoutubeLoaded
                        ? state.response.nextPageToken
                        : "";
                    // Use the loaded data to build your UI
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.response.items.length +
                          (state is YoutubeLoadingMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index < state.response.items.length) {
                          final video = state.response.items[index];
                          return InkWell(
                            child: CustomCard(
                              thumbnailUrl:
                                  video.snippet.thumbnails["medium"]!.url,
                              title: video.snippet.title,
                              description: video.snippet.description,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VideoPlayerScreen(
                                    videoUrl: video.id.videoId,
                                    thumbnailUrl:
                                        video.snippet.thumbnails["medium"]!.url,
                                    title: video.snippet.title,
                                    description: video.snippet.description,
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          // Loading indicator for fetching more data
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    );
                  } else if (state is YoutubeError) {
                    return Text(
                        'Error: ${state.message}'); // Show error message
                  } else {
                    return const SizedBox(); // Handle other states if needed
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
