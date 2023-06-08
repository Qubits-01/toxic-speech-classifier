import 'package:equatable/equatable.dart';

class RatingsAndReviewsEntity extends Equatable {
  const RatingsAndReviewsEntity({
    required this.ratingsAndReviewsId,
    required this.username,
    required this.rating,
    required this.review,
    required this.displayPhotoLink,
  });

  final int ratingsAndReviewsId;
  final String username;
  final double rating;
  final String review;
  final String displayPhotoLink;

  @override
  List<Object?> get props => [
        username,
        rating,
        review,
        displayPhotoLink,
      ];
}
