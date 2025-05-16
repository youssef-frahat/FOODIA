import 'package:equatable/equatable.dart';

class Review extends Equatable {
  final String? userName;
  final String? userImage;
  final int? star;
  final String? comment;
  final String? createdAt;

  const Review({
    this.userName,
    this.userImage,
    this.star,
    this.comment,
    this.createdAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    userName: json['user_name'] as String?,
    userImage: json['user_image'] as String?,
    star: json['star'] as int?,
    comment: json['comment'] as String?,
    createdAt: json['created_at'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'user_name': userName,
    'user_image': userImage,
    'star': star,
    'comment': comment,
    'created_at': createdAt,
  };

  @override
  List<Object?> get props {
    return [userName, userImage, star, comment, createdAt];
  }
}
