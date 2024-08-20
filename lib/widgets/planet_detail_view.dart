import 'package:flutter/material.dart';
import 'package:galactic_trails/models/planet_info_model.dart';

class PlanetDetailView extends StatefulWidget {
  final PlanetInfoModel planet;

  const PlanetDetailView({super.key, required this.planet});

  @override
  PlanetDetailViewState createState() => PlanetDetailViewState();
}

class PlanetDetailViewState extends State<PlanetDetailView> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.planet.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                widget.planet.image,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.planet.title,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            buildKeyDetails(),
            const SizedBox(height: 16),
            Text(
              getFunFact(widget.planet.title),
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 20),
            buildLearnMoreSection(),
          ],
        ),
      ),
    );
  }

  Widget buildKeyDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Distance from Sun: ${widget.planet.sunnyTitle}',
          style: const TextStyle(fontSize: 18, color: Colors.white70),
        ),
        const SizedBox(height: 8),
        Text(
          'Surface Area: ${widget.planet.distanceTitle}',
          style: const TextStyle(fontSize: 18, color: Colors.white70),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  String getFunFact(String title) {
    switch (title) {
      case 'Mercury':
        return 'Fun Fact: Mercury has no moons and no atmosphere to retain heat, making it both very hot and very cold.';
      case 'Venus':
        return 'Fun Fact: Venus spins in the opposite direction to most planets, meaning the Sun rises in the west and sets in the east.';
      case 'Earth':
        return 'Fun Fact: Earth is the only planet not named after a god, and it has the perfect conditions to support life.';
      case 'Mars':
        return 'Fun Fact: Mars has the largest volcano in the solar system, Olympus Mons, which is about 13.6 miles high.';
      case 'Jupiter':
        return 'Fun Fact: Jupiter is so large that it could fit all the other planets inside it and still have room to spare.';
      case 'Saturn':
        return 'Fun Fact: Saturn\'s rings are made of billions of pieces of ice, rock, and dust, some as small as a grain of sand.';
      case 'Uranus':
        return 'Fun Fact: Uranus is the only planet that spins on its side, making its seasons extremely long.';
      case 'Neptune':
        return 'Fun Fact: Neptune has the strongest winds in the solar system, reaching speeds of over 1,200 miles per hour.';
      default:
        return 'Fun Fact: This planet has many more secrets waiting to be discovered!';
    }
  }

  Widget buildLearnMoreSection() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: isExpanded
                  ? const LinearGradient(
                      colors: [Colors.redAccent, Colors.deepPurple],
                    )
                  : const LinearGradient(
                      colors: [Colors.blue, Colors.greenAccent],
                    ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 6,
                ),
              ],
            ),
            child: Text(
              isExpanded ? 'Show Less' : 'Learn More',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        if (isExpanded) ...[
          const SizedBox(height: 16),
          Text(
            getAdditionalInfo(widget.planet.title),
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white60,
            ),
          ),
        ],
      ],
    );
  }

  String getAdditionalInfo(String title) {
    switch (title) {
      case 'Mercury':
        return 'Mercury\'s surface is heavily cratered, resembling our Moon. It has a very thin atmosphere, which is why it experiences extreme temperature fluctuations. Scientists believe that ice may exist in permanently shadowed craters at its poles.';
      case 'Venus':
        return 'Venus has a thick, toxic atmosphere filled with carbon dioxide and clouds of sulfuric acid, making it the hottest planet. Its surface is covered with volcanoes and deformed mountains.';
      case 'Earth':
        return 'Earth has a vast array of ecosystems, from polar ice caps to tropical rainforests. It is the only known planet to have large bodies of liquid water on its surface, which are essential for life as we know it.';
      case 'Mars':
        return 'Mars has the largest dust storms in the solar system, which can last for months and cover the entire planet. Its iron oxide-rich soil gives it the reddish appearance and it has polar ice caps made of water and carbon dioxide.';
      case 'Jupiter':
        return 'Jupiter\'s Great Red Spot is a giant storm that has been raging for at least 400 years. The planet\'s magnetic field is the strongest of any planet in the solar system and it has a faint ring system made up of dust particles.';
      case 'Saturn':
        return 'Saturn\'s rings are made up of ice particles, rocky debris, and dust. The planet has 82 moons, with Titan being the largest. It has a low density, meaning it would float in water if there were a large enough body of water to contain it.';
      case 'Uranus':
        return 'Uranus\'s blue color comes from methane in its atmosphere. It has 27 known moons and a faint ring system. The planet\'s unique tilt causes extreme seasonal variations and long periods of daylight or darkness at the poles.';
      case 'Neptune':
        return 'Neptune is known for its striking blue color, which is due to the presence of methane in its atmosphere. The planet has 14 known moons, with Triton being the largest. It also has a faint ring system and experiences intense storms and winds.';
      default:
        return 'More information about this planet will be available soon!';
    }
  }
}
