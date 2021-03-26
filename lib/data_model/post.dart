import"package:flutter/material.dart";

class Post{
  String postId;
  String userId;
  String caption;
  DateTime postDateTime;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  Post({
    @required this.postId,
    @required this.userId,
    @required this.caption,
    @required this.postDateTime,
  });

  Post copyWith({
    String postId,
    String userId,
    String caption,
    DateTime postDateTime,
  }) {
    return new Post(
      postId: postId ?? this.postId,
      userId: userId ?? this.userId,
      caption: caption ?? this.caption,
      postDateTime: postDateTime ?? this.postDateTime,
    );
  }

  @override
  String toString() {
    return 'Post{postId: $postId, userId: $userId, caption: $caption, postDateTime: $postDateTime}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Post &&
          runtimeType == other.runtimeType &&
          postId == other.postId &&
          userId == other.userId &&
          caption == other.caption &&
          postDateTime == other.postDateTime);

  @override
  int get hashCode =>
      postId.hashCode ^
      userId.hashCode ^
      caption.hashCode ^
      postDateTime.hashCode;

  factory Post.fromMap(Map<String, dynamic> map) {
    return new Post(
      postId: map['postId'] as String,
      userId: map['userId'] as String,
      caption: map['caption'] as String,
      //postDateTime: map['postDateTime'] as DateTime,
        postDateTime: map['postDateTime'] == null
        ? null : DateTime.parse(map['postDateTime'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'postId': this.postId,
      'userId': this.userId,
      'caption': this.caption,
      'postDateTime': this.postDateTime.toIso8601String(),
    } as Map<String, dynamic>;
  }

//</editor-fold>

}