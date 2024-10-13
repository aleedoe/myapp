import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String userName;

  const HomeScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/avatar.png"), // Avatar user
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hallo, $userName", // Menampilkan nama user
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Selamat Pagi.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                "assets/images/banner.png", // Gambar makanan
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Image.asset(
                      "assets/images/noodle.png", // Gambar icon noodle berwarna
                      width: 50,
                      height: 50,
                    ),
                    title: const Text('Noodle'),
                    subtitle: const Text('Rp23.000'),
                  ),
                  ListTile(
                    leading: Image.asset(
                      "assets/images/chicken.png", // Gambar icon chicken berwarna
                      width: 50,
                      height: 50,
                    ),
                    title: const Text('Chicken'),
                    subtitle: const Text('Rp15.000'),
                  ),
                  ListTile(
                    leading: Image.asset(
                      "assets/images/french_fries.png", // Gambar icon french fries berwarna
                      width: 50,
                      height: 50,
                    ),
                    title: const Text('French Fries'),
                    subtitle: const Text('Rp11.000'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
