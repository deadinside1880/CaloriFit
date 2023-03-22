import 'package:calori_fit/Widgets/SettingScreen.dart';
import 'package:calori_fit/screens/notificationsettings.dart';
import 'package:calori_fit/screens/unitsettings.dart';
import 'package:flutter/material.dart';

import '../Widgets/ProfileScreenOption.dart';

class MainSettings extends StatelessWidget {
  const MainSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsScreen(
      title: "SETTINGS",
      widgets: [
        ProfileScreenOption(
          onPress: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UnitSettingsScreen())), 
          text: "Units of Measure", 
          isLastOption: false
        ),
        ProfileScreenOption(
          onPress: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NotificationSettings())), 
          text: "Notifications", 
          isLastOption: true
        ),
      ],
    );
  }
}