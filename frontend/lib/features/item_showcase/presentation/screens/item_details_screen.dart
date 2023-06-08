import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../ratings_and_reviews/presentation/ratings_and_reviews_screen.dart';

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({super.key});

  static const routeName = '/item-details';

  final imageName1 = 'dark_themed_food_1.jpg';
  final imageName2 = 'dark_themed_food_2.jpg';
  final imageName3 = 'dark_themed_food_3.jpg';
  final itemDescription =
      'A tantalizing fusion of flavors that will take your taste buds on an epic adventure through the shadows of culinary genius. Imagine a mischievous dance between rich dark chocolate, velvety caramel, and a subtle hint of mischief.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
        backgroundColor: Colors.black.withOpacity(0.2),
        actions: <Widget>[
          // Temporary (for visual UI only).
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.ellipsisVertical),
            onPressed: () {},
          ),

          // TODO: Use MenuAnchor for this (ref: https://api.flutter.dev/flutter/material/MenuAnchor-class.html)
          // MenuAnchor(
          //   menuChildren: <Widget>[
          //     MenuItemButton(
          //       child: const Text('Report'),
          //       onPressed: () {},
          //     )
          //   ],
          //   child: const FaIcon(FontAwesomeIcons.ellipsisVertical),
          // ),
        ],
      ),
      body: Column(
        children: <Widget>[
          // Upper Container (Item Photos View).
          Container(
            height: 300.0,
            color: Colors.red,
            child: ImageSlideshow(
              initialPage: 0,
              isLoop: true,
              autoPlayInterval: 5000,
              children: <Widget>[
                Image.asset(
                  'assets/$imageName1',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/$imageName2',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/$imageName3',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),

          // Lower Container (Item Details and other things View).
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Item name.
                  Text(
                    'Darkish Delights',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 10.0),

                  // Rating bar and button to Ratings and Reviews screen.
                  Row(
                    children: <Widget>[
                      RatingBar(
                        initialRating: 3.5,
                        minRating: 1,
                        maxRating: 5,
                        itemCount: 5,
                        itemSize: 25.0,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 2.0),
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

                      // Ratings and Reviews button.
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15.0,
                        ),
                        visualDensity: const VisualDensity(horizontal: -4),
                        onPressed: () {
                          GoRouter.of(context)
                              .push(RatingsAndReviewsScreen.routeName);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),

                  // Item description.
                  Text(
                    itemDescription,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 20.0),

                  // Price and quantity row.
                  Row(
                    children: <Widget>[
                      // Price.
                      Text(
                        '₱69.69',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        '  20% off',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const Spacer(),

                      // Quantity selector.
                      Row(
                        children: <Widget>[
                          // +
                          IconButton.outlined(
                            icon: const Icon(Icons.remove_rounded),
                            visualDensity: const VisualDensity(horizontal: -4),
                            onPressed: () {},
                          ),

                          // Quantity value.
                          Text(
                            '   2   ',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),

                          // -
                          IconButton.outlined(
                            icon: const Icon(Icons.add_rounded),
                            visualDensity: const VisualDensity(horizontal: -4),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0),

                  // Other important short details.
                  // Delivery fee gimmick.
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.delivery_dining_rounded,
                        color: Colors.green[800],
                      ),
                      Text(
                        ' Free Delivery',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                  const Spacer(),

                  // Add to card and Favorite row.
                  Row(
                    children: <Widget>[
                      // Favorites icon button.
                      IconButton.filledTonal(
                        icon: const Icon(Icons.favorite_border_rounded),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 10.0),

                      // Add to Cart button.
                      Expanded(
                        child: FilledButton(
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.add_shopping_cart_rounded),
                              Text('  Add to Cart'),
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
