import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool loading = false;
  int downloads = 0;

  Future<void> startLoading() async {
    setState(() {
      loading = true;
    });

    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;
    setState(() {
      loading = false;
      downloads++;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Download finished'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              downloads--;
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Loading')),
      body: Center(
        child: loading
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Downloads: $downloads'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: startLoading,
                    child: const Text('Start Download'),
                  ),
                ],
              ),
      ),
    );
  }
}
