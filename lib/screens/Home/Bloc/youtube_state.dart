import 'package:awekon/data/Remote/Model/YoutubeDataModel.dart';
import 'package:equatable/equatable.dart';

abstract class YoutubeState extends Equatable {
  @override
  List<Object?> get props => [];

  get response => null;
}

class YoutubeInitial extends YoutubeState {}

class YoutubeLoading extends YoutubeState {}

class YoutubeLoaded extends YoutubeState {
  @override
  final YouTubeSearchListResponse response;
  YoutubeLoaded({required this.response});

  @override
  List<YouTubeSearchListResponse?> get props => [response];
}

class YoutubeError extends YoutubeState {
  final String message;
  YoutubeError({required this.message});
  @override
  List<Object?> get props => [message];
}

class YoutubeLoadingMore extends YoutubeLoaded {
  YoutubeLoadingMore({required YouTubeSearchListResponse response})
      : super(response: response);

  @override
  List<YouTubeSearchListResponse> get props => [response];
}
