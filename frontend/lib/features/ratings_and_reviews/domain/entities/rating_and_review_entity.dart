import 'package:equatable/equatable.dart';

class RatingAndReviewEntity extends Equatable {
  const RatingAndReviewEntity({
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
