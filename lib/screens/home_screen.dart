import 'package:flutter/material.dart';

import 'profile_card_screen.dart';
import 'task1_selection.dart';
import 'task2_inputs.dart';
import 'task3_buttons.dart';
import 'task4_indicators.dart';
import 'task5_dialogs.dart';
import 'task6_sliders.dart';
import 'task7_list.dart';
import 'task8_grid.dart';
import 'task9_navigation.dart';
import 'task10_containers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = [
      ['Example: Profile Card', const ProfileCardScreen()],
      ['Task 1: Checkbox & Switch', const SelectionScreen()],
      ['Task 2: Text Fields', const LoginScreen()],
      ['Task 3: Buttons', const CounterScreen()],
      ['Task 4: Progress & SnackBar', const LoadingScreen()],
      ['Task 5: Dialogs', const DialogsScreen()],
      ['Task 6: Slider & Date Picker', const SliderScreen()],
      ['Task 7: ListView', const ListScreen()],
      ['Task 8: GridView', const GalleryScreen()],
      ['Task 9: Navigation', const NavigationScreen()],
      ['Task 10: Card & ExpansionTile', const ContainersScreen()],
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Lab 4 - Flutter Widgets')),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index][0] as String),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => tasks[index][1] as Widget),
              );
            },
          );
        },
      ),
    );
  }
}
