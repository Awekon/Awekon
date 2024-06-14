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
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late YoutubeCubit _youtubeCubit;
  late String? pagetoken;
  final String query = "random";

  @override
  void initState() {
    super.initState();
    // Initialize the YoutubeCubit and call the fetch function with a random query
    _youtubeCubit = YoutubeCubit(YouTubeRepository());
    // _youtubeCubit.fetchYoutubeVideos(query); // Pass any random query here
  }

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  void _loadMore() {
    if (pagetoken != null && pagetoken!.isNotEmpty) {
      _youtubeCubit.fetchmoreYoutubeVideos(query, pagetoken!);
    }
  }

  void _retryFetch() {
    _youtubeCubit.fetchYoutubeVideos(query);
  }

  @override
  void dispose() {
    // Dispose of the cubit to prevent memory leaks
    _youtubeCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const ForYouListView(), // Adding the For You list view here
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
                child: BlocConsumer<YoutubeCubit, YoutubeState>(
                  listener: (context, state) {
                    if (state is YoutubeLoaded) {
                      pagetoken = state.response.nextPageToken;
                    } else if (state is YoutubeLoadingMore) {
                      // Keep the pagetoken
                    } else if (state is YoutubeError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: ${state.message}')),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is YoutubeLoading) {
                      return const CircularProgressIndicator(); // Show loading indicator while fetching data for the first time
                    } else if (state is YoutubeLoaded ||
                        state is YoutubeLoadingMore) {
                      return Column(
                        children: [
                          ListView.builder(
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
                                          thumbnailUrl: video.snippet
                                              .thumbnails["medium"]!.url,
                                          title: video.snippet.title,
                                          description:
                                              video.snippet.description,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              } else {
                                // Load more data when reaching the end of the list
                                _loadMore();
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            },
                          ),
                          if (state is YoutubeLoadingMore)
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: CircularProgressIndicator(),
                            ),
                        ],
                      );
                    } else if (state is YoutubeError) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: IconButton(
                          icon: const Icon(Icons.refresh),
                          onPressed: _retryFetch,
                          tooltip: 'Retry',
                        ),
                      );
                    } else {
                      return const SizedBox(); // Handle other states if needed
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
