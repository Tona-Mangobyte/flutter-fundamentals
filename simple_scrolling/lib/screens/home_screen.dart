import 'package:flutter/material.dart';

import 'package:simple_scrolling/models/location.dart';

import '../widgets/location_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  final urlPrefix = 'https://docs.flutter.dev/cookbook/img-files/effects/parallax';
  late List<Location> locations;
  @override
  void initState() {
    super.initState();
    locations = [
      Location(
        name: 'Mount Rushmore',
        place: 'U.S.A',
        imageUrl: '$urlPrefix/01-mount-rushmore.jpg',
      ),
      Location(
        name: 'Gardens By The Bay',
        place: 'Singapore',
        imageUrl: '$urlPrefix/02-singapore.jpg',
      ),
      Location(
        name: 'Machu Picchu',
        place: 'Peru',
        imageUrl: '$urlPrefix/03-machu-picchu.jpg',
      ),
      Location(
        name: 'Vitznau',
        place: 'Switzerland',
        imageUrl: '$urlPrefix/04-vitznau.jpg',
      ),
      Location(
        name: 'Bali',
        place: 'Indonesia',
        imageUrl: '$urlPrefix/05-bali.jpg',
      ),
      Location(
        name: 'Mexico City',
        place: 'Mexico',
        imageUrl: '$urlPrefix/06-mexico-city.jpg',
      ),
      Location(
        name: 'Cairo',
        place: 'Egypt',
        imageUrl: '$urlPrefix/07-cairo.jpg',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (final location in locations)
            LocationListItem(
              imageUrl: location.imageUrl,
              name: location.name,
              country: location.place,
            ),
        ],
      ),
    );
  }
}