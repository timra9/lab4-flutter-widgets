import 'package:flutter/material.dart';

class ContainersScreen extends StatelessWidget {
  const ContainersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final faqs = [
      [
        'What is Flutter?',
        'Flutter is a UI toolkit from Google for building apps for mobile, web and desktop from one codebase.',
      ],
      [
        'What language does Flutter use?',
        'Flutter uses the Dart programming language.',
      ],
      [
        'What is a StatefulWidget?',
        'A widget that has a State object, so it can change and rebuild when setState is called.',
      ],
      [
        'What is hot reload?',
        'It lets you see code changes in the running app almost instantly without losing the app state.',
      ],
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Card & FAQ')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Card(
            elevation: 4,
            child: ListTile(
              leading: const Icon(Icons.info, size: 40, color: Colors.blue),
              title: const Text(
                'Mobile Programming',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Lab 4 - Flutter Widgets'),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Opening course...')),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'FAQ',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          for (final faq in faqs)
            ExpansionTile(
              title: Text(faq[0]),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(faq[1]),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
