import 'package:flutter/material.dart';
import 'package:galactic_trails/models/planet_info_model.dart';
import 'package:galactic_trails/widgets/planet_info_card.dart';

class PlanetInfoCardGridView extends StatelessWidget {
  final String searchQuery;

  const PlanetInfoCardGridView({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    final infoItem = [
      const PlanetInfoModel(
        title: 'Mercury',
        subTitle:
            'Mercury, the smallest planet, orbits the Sun swiftly, completing an orbit in just 88 days.',
        sunnyTitle: '57.9 million km',
        distanceTitle: '74.8 million km²',
        image: 'assets/images/mercury.jpg',
      ),
      const PlanetInfoModel(
        title: 'Venus',
        subTitle:
            'Venus is similar in size to Earth but has thick sulfuric clouds, trapping heat and making it the hottest planet by far.',
        sunnyTitle: '108.2 million km',
        distanceTitle: '460.2 million km²',
        image: 'assets/images/venus.jpg',
      ),
      const PlanetInfoModel(
        title: 'Earth',
        subTitle:
            'Earth, the only planet with life, has vast oceans, diverse ecosystems, and an atmosphere that protects life forms.',
        sunnyTitle: '149.6 million km',
        distanceTitle: '510.1 million km²',
        image: 'assets/images/earth.jpg',
      ),
      const PlanetInfoModel(
        title: 'Mars',
        subTitle:
            'Mars, known for its red color, has the tallest volcano and deepest canyon in our solar system. It might have had water.',
        sunnyTitle: '227.9 million km',
        distanceTitle: '144.8 million km²',
        image: 'assets/images/mars.png',
      ),
      const PlanetInfoModel(
        title: 'Jupiter',
        subTitle:
            'Jupiter, the largest planet, has a thick atmosphere of hydrogen and helium, a powerful magnetic field, and many moons.',
        sunnyTitle: '778.3 million km',
        distanceTitle: '61.4 billion km²',
        image: 'assets/images/jupiter.jpg',
      ),
      const PlanetInfoModel(
        title: 'Saturn',
        subTitle:
            'Saturn is famous for its rings made of ice and rock particles. It is the second-largest planet with numerous moons.',
        sunnyTitle: '1,427.0 million km',
        distanceTitle: '42.7 billion km²',
        image: 'assets/images/saturn.jpg',
      ),
      const PlanetInfoModel(
        title: 'Uranus',
        subTitle:
            'Uranus rotates on its side due to its tilted axis. Its atmosphere, rich in methane, gives it a blue-green hue.',
        sunnyTitle: '2,871.0 million km',
        distanceTitle: '8.1 billion km²',
        image: 'assets/images/uranus.png',
      ),
      const PlanetInfoModel(
        title: 'Neptune',
        subTitle:
            'Neptune, the furthest planet, has intense winds and dark storms. Its deep blue color comes from methane in its atmosphere.',
        sunnyTitle: '4,498.3 million km',
        distanceTitle: '7.6 billion km²',
        image: 'assets/images/neptune.png',
      ),
    ];

    final filteredItems = infoItem
        .where((item) =>
            item.title.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return GridView.builder(
      itemCount: filteredItems.length,
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 1.6,
        crossAxisSpacing: 5,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 30,
          ),
          child: PlanetInfoCard(
            infoModel: filteredItems[index],
          ),
        );
      },
    );
  }
}
