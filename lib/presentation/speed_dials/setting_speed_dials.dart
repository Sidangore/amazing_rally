import 'package:badminton_1/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class SettingSpeedDials extends StatelessWidget {
  const SettingSpeedDials({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.settings,      
      activeIcon: Icons.close,
      backgroundColor: kCourtColor,      
      children: [
        SpeedDialChild(
          child: const Icon(Icons.settings),
          label: 'Settings',
          onTap: () {
            // Your settings logic here
          },
        ),
        // Add more options as needed
      ],
    );
  }
}
