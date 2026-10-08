import 'package:flutter/material.dart';

import '../main.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  bool agreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: darkMode.value,
            onChanged: (value) {
              setState(() {
                darkMode.value = value;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Agree to Terms'),
            value: agreed,
            onChanged: (value) {
              setState(() {
                agreed = value!;
              });
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: agreed
                ? () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Continued')),
                    );
                  }
                : null,
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }
}
