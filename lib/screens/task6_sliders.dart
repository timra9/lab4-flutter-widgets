import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double volume = 50;
  DateTime? selectedDate;

  Future<void> pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  String formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    return '$day.$month.${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Volume & Date')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Icon(volume == 0 ? Icons.volume_off : Icons.volume_up),
                Expanded(
                  child: Slider(
                    value: volume,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    label: '${volume.round()}%',
                    onChanged: (value) {
                      setState(() {
                        volume = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Text(
              'Volume: ${volume.round()}%',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: pickDate,
              icon: const Icon(Icons.calendar_today),
              label: const Text('Pick a date'),
            ),
            const SizedBox(height: 16),
            Text(
              selectedDate == null
                  ? 'No date selected'
                  : 'Selected: ${formatDate(selectedDate!)}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
