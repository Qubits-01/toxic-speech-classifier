import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../core/features/app_settings/presentation/screens/app_settings_screen.dart';
import '../domain/entities/rating_and_review_entity.dart';

class RatingsAndReviewsScreen extends StatefulWidget {
  const RatingsAndReviewsScreen({super.key});

  static const routeName = '/ratings-and-reviews';

  @override
  State<RatingsAndReviewsScreen> createState() =>
      _RatingsAndReviewsScreenState();
}

class _RatingsAndReviewsScreenState extends State<RatingsAndReviewsScreen> {
  List<bool> _toxicComments = [false, false, false, false, false, false, false];
  final dummyRatingsAndReviews = <RatingAndReviewEntity>[
    const RatingAndReviewEntity(
      ratingsAndReviewsId: 1,
      username: 'ShawarmaGod',
      rating: 5.0,
      review:
          'The food was masarap and decent for its price. Gustong gusto ko yung caramel at extra sides. On time din dumating yung delivery at maayos ang packaging unlike other stores. I will definitely order again and try to share these with my friends <3 ',
      displayPhotoLink: 'user-display-photo-sample-1.jpg',
    ),
    const RatingAndReviewEntity(
      ratingsAndReviewsId: 2,
      username: 'MajesticUnicorn',
      rating: 1.0,
      review:
          'Ano ba to, parang pagkain ng aso! Di masarap ang pagkakaluto. Sayang lang ang pera ko mga putcharagis kayo.',
      displayPhotoLink: 'user-display-photo-sample-2.jpg',
    ),
    const RatingAndReviewEntity(
      ratingsAndReviewsId: 3,
      username: 'UPIska',
      rating: 5.0,
      review:
          'My midnight cravings solved. Sobrang saya ko dahil nakagamit ako ng 100% discount voucher for this yeaahheeyy! Please do more food colabs with other brands next time. Also, nagustuhan ko yung action figure toy na freebie.',
      displayPhotoLink: 'user-display-photo-sample-3.jpg',
    ),
    const RatingAndReviewEntity(
      ratingsAndReviewsId: 4,
      username: 'FluffyVanilla',
      rating: 3.0,
      review:
          'All I can say is it is not the best for its price. The meat was cooked perfectly but the sides are too sweet for me. I suggest that you add a sugar level option in the future. This is 3 out of 10 for me.',
      displayPhotoLink: 'user-display-photo-sample-4.jpg',
    ),
    const RatingAndReviewEntity(
      ratingsAndReviewsId: 5,
      username: 'MrBean',
      rating: 5.0,
      review:
          'Ang saraaaaaap 💖😍😍💖 para akong nasa langit sa bawat kagat. Masarap din yung delivery guy ayiiee.',
      displayPhotoLink: 'user-display-photo-sample-5.jpg',
    ),
    const RatingAndReviewEntity(
      ratingsAndReviewsId: 6,
      username: 'KamisatoAyato',
      rating: 5.0,
      review: 'This is some good shit.',
      displayPhotoLink: 'user-display-photo-sample-6.jpg',
    ),
    const RatingAndReviewEntity(
      ratingsAndReviewsId: 7,
      username: 'ChatGPT',
      rating: 4.5,
      review:
          'The packaging was very neat. I like the ribbon attached to the food box. It is so cute. The food was also worth it, especially the teriyaki sauce. The only problem is the delivery time but I know that it is out of the seller\'s control. This is a 10 out of 10 for me!',
      displayPhotoLink: 'user-display-photo-sample-7.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    int i = -1;

    // Use the toxic-speech-classifier API.
    setState(() {
      determineToxicComments().then((value) => _toxicComments = value);
      print('data updated');
      print(_toxicComments);
    });

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
                      ...dummyRatingsAndReviews.map((entity) {
                        i += 1;
                        return RatingAndReviewCard(
                          entity: entity,
                          isToxic: _toxicComments[i],
                        );
                      }).toList(),

                      // Ratings and Review card.
                      // const RatingAndReviewCard(),
                      // const RatingAndReviewCard(),
                      // const RatingAndReviewCard(),
                      // const RatingAndReviewCard(),
                      // const RatingAndReviewCard(),
                      // const RatingAndReviewCard(),
                      // const RatingAndReviewCard(),
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
  const RatingAndReviewCard({
    super.key,
    required entity,
    this.isToxic = true,
  }) : _entity = entity;

  final RatingAndReviewEntity _entity;
  final bool isToxic;

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
                  CircleAvatar(
                    foregroundImage: AssetImage(
                      'assets/user_display_photos/${_entity.displayPhotoLink}',
                    ),
                  ),
                  const SizedBox(width: 10.0),

                  // Username
                  Text(
                    _entity.username,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(width: 15.0),

                  // Toxic chip.
                  Visibility(
                    visible: isToxic,
                    child: Chip(
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
                    initialRating: _entity.rating,
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
                  Text(' ${_entity.rating}'),
                ],
              ),
              const SizedBox(height: 15.0),

              // Review
              Text(
                _entity.review,
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

Future<List<bool>> determineToxicComments() async {
  return [false, true, false, false, true, true, false];
}
