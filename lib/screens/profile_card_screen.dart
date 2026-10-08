import 'package:flutter/material.dart';

class ProfileCardScreen extends StatelessWidget {
  const ProfileCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Card')),
      body: const Center(child: MediaProfileCard()),
    );
  }
}

class MediaProfileCard extends StatefulWidget {
  const MediaProfileCard({super.key});

  @override
  State<MediaProfileCard> createState() => _MediaProfileCardState();
}

class _MediaProfileCardState extends State<MediaProfileCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/profile.png',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 120,
                    height: 120,
                    color: Colors.grey[300],
                    child: const Icon(Icons.broken_image, size: 40),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'User Profile Card',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
                size: 28,
              ),
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
