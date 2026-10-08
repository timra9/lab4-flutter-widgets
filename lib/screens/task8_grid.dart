import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gallery')),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        padding: const EdgeInsets.all(8),
        children: List.generate(12, (index) {
          final url = 'https://picsum.photos/id/${index + 10}/400/400';
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => PhotoScreen(url: url)),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                url,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.broken_image),
                  );
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}

class PhotoScreen extends StatelessWidget {
  final String url;

  const PhotoScreen({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(child: Image.network(url, fit: BoxFit.contain)),
      ),
    );
  }
}
