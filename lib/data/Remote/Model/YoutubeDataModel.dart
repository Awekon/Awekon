// lib/models.dart

class YouTubeSearchListResponse {
  final String kind;
  final String etag;
  final String? nextPageToken;
  final String? prevPageToken;
  final String regionCode;
  final int totalResults;
  final int resultsPerPage;
  final List<YouTubeSearchResult> items;

  YouTubeSearchListResponse({
    required this.kind,
    required this.etag,
    required this.nextPageToken,
    this.prevPageToken,
    required this.regionCode,
    required this.totalResults,
    required this.resultsPerPage,
    required this.items,
  });

  factory YouTubeSearchListResponse.fromJson(Map<String, dynamic> json) {
    var itemsJson = json['items'] as List;
    List<YouTubeSearchResult> itemsList =
        itemsJson.map((i) => YouTubeSearchResult.fromJson(i)).toList();

    return YouTubeSearchListResponse(
      kind: json['kind'],
      etag: json['etag'],
      nextPageToken: json['nextPageToken'],
      regionCode: json['regionCode'],
      totalResults: json['pageInfo']['totalResults'],
      resultsPerPage: json['pageInfo']['resultsPerPage'],
      items: itemsList,
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> itemsJson =
        items.map((i) => i.toJson()).toList();

    return {
      'kind': kind,
      'etag': etag,
      'nextPageToken': nextPageToken,
      'regionCode': regionCode,
      'pageInfo': {
        'totalResults': totalResults,
        'resultsPerPage': resultsPerPage,
      },
      'items': itemsJson,
    };
  }
}

class YouTubeSearchResult {
  final String kind;
  final String etag;
  final Id id;
  final Snippet snippet;

  YouTubeSearchResult({
    required this.kind,
    required this.etag,
    required this.id,
    required this.snippet,
  });

  factory YouTubeSearchResult.fromJson(Map<String, dynamic> json) {
    return YouTubeSearchResult(
      kind: json['kind'],
      etag: json['etag'],
      id: Id.fromJson(json['id']),
      snippet: Snippet.fromJson(json['snippet']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'kind': kind,
      'etag': etag,
      'id': id.toJson(),
      'snippet': snippet.toJson(),
    };
  }
}

class Id {
  final String kind;
  final String videoId;

  Id({
    required this.kind,
    required this.videoId,
  });

  factory Id.fromJson(Map<String, dynamic> json) {
    return Id(
      kind: json['kind'],
      videoId: json['videoId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'kind': kind,
      'videoId': videoId,
    };
  }
}

class Snippet {
  final String publishedAt;
  final String channelId;
  final String title;
  final String description;
  final Map<String, Thumbnail> thumbnails;
  final String channelTitle;
  final String liveBroadcastContent;
  final String publishTime;

  Snippet({
    required this.publishedAt,
    required this.channelId,
    required this.title,
    required this.description,
    required this.thumbnails,
    required this.channelTitle,
    required this.liveBroadcastContent,
    required this.publishTime,
  });

  factory Snippet.fromJson(Map<String, dynamic> json) {
    Map<String, Thumbnail> thumbnails = {};
    json['thumbnails'].forEach((key, value) {
      thumbnails[key] = Thumbnail.fromJson(value);
    });

    return Snippet(
      publishedAt: json['publishedAt'],
      channelId: json['channelId'],
      title: json['title'],
      description: json['description'],
      thumbnails: thumbnails,
      channelTitle: json['channelTitle'],
      liveBroadcastContent: json['liveBroadcastContent'],
      publishTime: json['publishTime'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> thumbnailsJson = {};
    thumbnails.forEach((key, value) {
      thumbnailsJson[key] = value.toJson();
    });

    return {
      'publishedAt': publishedAt,
      'channelId': channelId,
      'title': title,
      'description': description,
      'thumbnails': thumbnailsJson,
      'channelTitle': channelTitle,
      'liveBroadcastContent': liveBroadcastContent,
      'publishTime': publishTime,
    };
  }
}

class Thumbnail {
  final String url;
  final int width;
  final int height;

  Thumbnail({
    required this.url,
    required this.width,
    required this.height,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) {
    return Thumbnail(
      url: json['url'],
      width: json['width'],
      height: json['height'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'width': width,
      'height': height,
    };
  }
}
