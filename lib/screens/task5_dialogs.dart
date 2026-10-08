import 'package:flutter/material.dart';

class DialogsScreen extends StatefulWidget {
  const DialogsScreen({super.key});

  @override
  State<DialogsScreen> createState() => _DialogsScreenState();
}

class _DialogsScreenState extends State<DialogsScreen> {
  List<String> items = ['Photo 1', 'Photo 2', 'Photo 3', 'Photo 4'];

  void showDeleteDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete item'),
          content: Text('Are you sure you want to delete ${items[index]}?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  items.removeAt(index);
                });
                Navigator.pop(context);
              },
              child: const Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void showShareSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.message),
                title: const Text('Message'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: const Text('Email'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(Icons.link),
                title: const Text('Copy link'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(Icons.close),
                title: const Text('Cancel'),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialogs'),
        actions: [
          IconButton(icon: const Icon(Icons.share), onPressed: showShareSheet),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.image),
            title: Text(items[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => showDeleteDialog(index),
            ),
          );
        },
      ),
    );
  }
}
