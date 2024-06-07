import 'dart:convert';

import 'package:awekon/core/constants/CommonConstants.dart';
import 'package:awekon/data/Remote/Model/YoutubeDataModel.dart';
import 'package:http/http.dart' as http;

class YouTubeRepository {
  static const String apiKey = YoutubeAPIkey;
  static const String baseUrl = 'https://www.googleapis.com/youtube/v3/search';

  Future<YouTubeSearchListResponse> fetchVideos(
      String query, String? pageToken) async {
    try {
      final Uri uri = Uri.parse(
          '$baseUrl?part=snippet&q=$query&type=video&key=$apiKey&maxResults=10${pageToken != null ? '&pageToken=$pageToken' : ''}');
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        return YouTubeSearchListResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load videos: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load videos: $e');
    }
  }
}
