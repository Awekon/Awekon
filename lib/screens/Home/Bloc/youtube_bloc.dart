// youtube_bloc.dart
import 'package:awekon/data/Remote/Model/YoutubeDataModel.dart';
import 'package:awekon/data/Remote/Repository/YoutubeDataFetchRepository.dart';
import 'package:awekon/screens/Home/Bloc/youtube_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YoutubeCubit extends Cubit<YoutubeState> {
  final YouTubeRepository _repository;

  YoutubeCubit(this._repository) : super(YoutubeInitial());

  void fetchYoutubeVideos(String query) async {
    try {
      emit(YoutubeLoading());
      final response = await _repository.fetchVideos(query, null);
      emit(YoutubeLoaded(response: response));
    } catch (e) {
      emit(YoutubeError(message: e.toString()));
    }
  }

  void fetchmoreYoutubeVideos(String query, String pageToken) async {
    try {
      final currentState = state;
      if (currentState is YoutubeLoaded) {
        emit(YoutubeLoadingMore(response: currentState.response));
        final response = await _repository.fetchVideos(query, pageToken);
        final combinedItems =
            List<YouTubeSearchResult>.from(currentState.response.items)
              ..addAll(response.items);
        final combinedResponse = YouTubeSearchListResponse(
          kind: response.kind,
          etag: response.etag,
          nextPageToken: response.nextPageToken,
          prevPageToken: response.prevPageToken,
          regionCode: response.regionCode,
          totalResults: response.totalResults,
          resultsPerPage: response.resultsPerPage,
          items: combinedItems,
        );
        emit(YoutubeLoaded(response: combinedResponse));
      }
    } catch (e) {
      emit(YoutubeError(message: e.toString()));
    }
  }
}
