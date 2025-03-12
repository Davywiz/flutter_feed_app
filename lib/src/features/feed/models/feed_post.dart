import 'package:equatable/equatable.dart';

class FeedPost extends Equatable {
  final String id;
  final String userId;
  final String username;
  final String profileImageUrl;
  final String content;
  final List<String> imageUrls;
  final int likes;
  final int comments;
  final int retweetCount;
  final DateTime timestamp;
  final bool isLiked;

  const FeedPost({
    required this.id,
    required this.userId,
    required this.username,
    required this.profileImageUrl,
    required this.content,
    this.imageUrls = const [],
    this.likes = 0,
    this.comments = 0,
    this.retweetCount = 0,
    required this.timestamp,
    this.isLiked = false,
  });

  /// Creates a copy of this post with updated values
  FeedPost copyWith({
    String? id,
    String? userId,
    String? username,
    String? profileImageUrl,
    String? content,
    List<String>? imageUrls,
    int? likes,
    int? comments,
    int? retweetCount,
    DateTime? timestamp,
    bool? isLiked,
  }) {
    return FeedPost(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      username: username ?? this.username,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      content: content ?? this.content,
      imageUrls: imageUrls ?? this.imageUrls,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      retweetCount: retweetCount ?? this.retweetCount,
      timestamp: timestamp ?? this.timestamp,
      isLiked: isLiked ?? this.isLiked,
    );
  }

  /// Toggles the like status and updates the like count
  FeedPost toggleLike() {
    return copyWith(isLiked: !isLiked, likes: isLiked ? likes - 1 : likes + 1);
  }

  /// Converts the model to a JSON-friendly format
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'username': username,
      'profileImageUrl': profileImageUrl,
      'content': content,
      'imageUrls': imageUrls,
      'likes': likes,
      'comments': comments,
      'retweetCount': retweetCount,
      'timestamp': timestamp.toIso8601String(),
      'isLiked': isLiked,
    };
  }

  /// Creates a `FeedPost` instance from JSON data
  factory FeedPost.fromJson(Map<String, dynamic> json) {
    return FeedPost(
      id: json['id'],
      userId: json['userId'],
      username: json['username'],
      profileImageUrl: json['profileImageUrl'],
      content: json['content'],
      imageUrls: List<String>.from(json['imageUrls'] ?? []),
      likes: json['likes'] ?? 0,
      comments: json['comments'] ?? 0,
      retweetCount: json['retweetCount'] ?? 0,
      timestamp: DateTime.parse(json['timestamp']),
      isLiked: json['isLiked'] ?? false,
    );
  }

  @override
  List<Object?> get props => [
    id,
    userId,
    username,
    content,
    likes,
    comments,
    retweetCount,
    timestamp,
    isLiked,
  ];
}
