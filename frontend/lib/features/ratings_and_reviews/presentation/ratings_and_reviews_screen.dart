import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../core/features/app_settings/presentation/screens/app_settings_screen.dart';
import '../domain/entities/ratings_and_reviews_entity.dart';

class RatingsAndReviewsScreen extends StatelessWidget {
  RatingsAndReviewsScreen({super.key});

  static const routeName = '/ratings-and-reviews';

  final dummyRatingsAndReviews = <RatingsAndReviewsEntity>[
    const RatingsAndReviewsEntity(
      ratingsAndReviewsId: 1,
      username: 'ShawarmaGod',
      rating: 4.5,
      review: 'This food is so great I became black.',
      displayPhotoLink: 'user-display-photo-sample-1.jpg',
    ),
    const RatingsAndReviewsEntity(
      ratingsAndReviewsId: 2,
      username: 'ShawarmaGod',
      rating: 4.5,
      review: 'This food is so great I became black.',
      displayPhotoLink: 'user-display-photo-sample-1.jpg',
    ),
    const RatingsAndReviewsEntity(
      ratingsAndReviewsId: 3,
      username: 'ShawarmaGod',
      rating: 4.5,
      review: 'This food is so great I became black.',
      displayPhotoLink: 'user-display-photo-sample-1.jpg',
    ),
    const RatingsAndReviewsEntity(
      ratingsAndReviewsId: 4,
      username: 'ShawarmaGod',
      rating: 4.5,
      review: 'This food is so great I became black.',
      displayPhotoLink: 'user-display-photo-sample-1.jpg',
    ),
    const RatingsAndReviewsEntity(
      ratingsAndReviewsId: 5,
      username: 'ShawarmaGod',
      rating: 4.5,
      review: 'This food is so great I became black.',
      displayPhotoLink: 'user-display-photo-sample-1.jpg',
    ),
    const RatingsAndReviewsEntity(
      ratingsAndReviewsId: 6,
      username: 'ShawarmaGod',
      rating: 4.5,
      review: 'This food is so great I became black.',
      displayPhotoLink: 'user-display-photo-sample-1.jpg',
    ),
    const RatingsAndReviewsEntity(
      ratingsAndReviewsId: 7,
      username: 'ShawarmaGod',
      rating: 4.5,
      review: 'This food is so great I became black.',
      displayPhotoLink: 'user-display-photo-sample-1.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ratings and Reviews'),
        backgroundColor: Colors.black.withOpacity(0.2),
        actions: <Widget>[
          IconButton(
            tooltip: 'App Settings',
            onPressed: () {
              GoRouter.of(context).push(AppSettingsScreen.routeName);
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          // Reviews list.
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  child: Column(
                    children: <Widget>[
                      // Ratings and Review card.
                      const RatingAndReviewCard(),
                      const RatingAndReviewCard(),
                      const RatingAndReviewCard(),
                      const RatingAndReviewCard(),
                      const RatingAndReviewCard(),
                      const RatingAndReviewCard(),
                      const RatingAndReviewCard(),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Write review area
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              right: 20.0,
              bottom: 15.0,
              left: 20.0,
            ),
            color: Colors.transparent,
            child: FilledButton(
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FaIcon(
                    FontAwesomeIcons.pen,
                    size: 20.0,
                  ),
                  SizedBox(width: 10.0),
                  Text('Write a review'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RatingAndReviewCard extends StatelessWidget {
  const RatingAndReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // User display photo and username.
              Row(
                children: <Widget>[
                  // User Display Photo.
                  const CircleAvatar(
                    foregroundImage: AssetImage(
                      'assets/user_display_photos/user-display-photo-sample-1.jpg',
                    ),
                  ),
                  const SizedBox(width: 10.0),

                  // Username
                  Text(
                    'ShawarmaGod',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(width: 15.0),

                  // Toxic chip.
                  Chip(
                    label: Text(
                      'toxic',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    backgroundColor:
                        Theme.of(context).colorScheme.errorContainer,
                    labelPadding: const EdgeInsets.all(0.0),
                    side: const BorderSide(width: 0.0),
                    visualDensity: const VisualDensity(
                      horizontal: -4,
                      vertical: -4,
                    ),
                  ),
                  const Spacer(),

                  // Ellipsis button.
                  IconButton(
                    onPressed: () {},
                    iconSize: 15.0,
                    visualDensity: const VisualDensity(horizontal: -4),
                    icon: const FaIcon(
                      FontAwesomeIcons.ellipsisVertical,
                    ),
                  )
                ],
              ),

              // Rating
              Row(
                children: <Widget>[
                  RatingBar(
                    initialRating: 3.5,
                    minRating: 1,
                    maxRating: 5,
                    itemCount: 5,
                    itemSize: 20.0,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                    allowHalfRating: true,
                    ratingWidget: RatingWidget(
                      empty: const Icon(
                        Icons.star_border_outlined,
                        color: Colors.amber,
                      ),
                      half: const Icon(
                        Icons.star_half_rounded,
                        color: Colors.amber,
                      ),
                      full: const Icon(
                        Icons.star_rounded,
                        color: Colors.amber,
                      ),
                    ),
                    onRatingUpdate: (double rating) {},
                  ),
                  const Text(' 3.5'),
                ],
              ),
              const SizedBox(height: 15.0),

              // Review
              Text(
                'This is a good food. Very good indeed. My friends should buy it. I\'m Ranjeet. Definitely not an indian enjoying darkish Delights. Give me a 100 dollar amazon gift card my good friend.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20.0),

              // Was this helpful question.
              Row(
                children: <Widget>[
                  Text(
                    'Was this review helpful?',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Spacer(),

                  // Yes and No buttons.
                  // Yes
                  TextButton(
                    style: TextButton.styleFrom(
                      visualDensity: const VisualDensity(
                        horizontal: -4,
                        vertical: -4,
                      ),
                      side: const BorderSide(color: Colors.white70),
                    ),
                    onPressed: () {},
                    child: const Text('Yes'),
                  ),
                  const SizedBox(width: 10.0),

                  // No
                  TextButton(
                    style: TextButton.styleFrom(
                      visualDensity: const VisualDensity(
                        horizontal: -4,
                        vertical: -4,
                      ),
                      side: const BorderSide(color: Colors.white70),
                    ),
                    onPressed: () {},
                    child: const Text('No'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
