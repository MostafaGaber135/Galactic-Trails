import 'package:flutter/material.dart';
import 'package:galactic_trails/models/planet_info_model.dart';
import 'package:galactic_trails/widgets/planet_detail_view.dart';

class PlanetInfoCard extends StatelessWidget {
  final PlanetInfoModel infoModel;

  const PlanetInfoCard({super.key, required this.infoModel});

  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    final cardWidth =
        MediaQuery.of(context).size.width * (isKeyboardOpen ? 0.7 : 0.8);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlanetDetailView(planet: infoModel),
          ),
        );
      },
      child: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 150,
              child: Container(
                width: cardWidth,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [Colors.blue, Colors.purple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 60),
                    Text(
                      infoModel.title,
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      infoModel.subTitle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Icon(
                          Icons.wb_sunny,
                          color: Colors.yellow,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          infoModel.sunnyTitle,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.directions_walk,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          infoModel.distanceTitle,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 80,
              child: CircleAvatar(
                radius: 70,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(infoModel.image),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
