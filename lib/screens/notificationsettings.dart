import 'package:calori_fit/Widgets/SettingScreen.dart';
import 'package:calori_fit/Widgets/Switch.dart';
import 'package:calori_fit/styles/Colors.dart';
import 'package:flutter/material.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {

  bool uploadReminders = true;
  bool rewardNotifications = true;

  @override
  Widget build(BuildContext context) {
    return SettingsScreen(
      title: "NOTIFICATION", 
      widgets: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          width: MediaQuery.of(context).size.width*.8,
          decoration: const  BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 2,
                color: grey
              ),
            )
          ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                const Text("Upload Reminders", style: TextStyle(fontSize: 18),),
                GestureDetector(
                  onTap: () => setState(() {
                   uploadReminders = !uploadReminders ;
                  }),
                  child: const CustomSwitch()
                )
              ],
            ),
          ),

          Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          width: MediaQuery.of(context).size.width*.8,
          decoration: const  BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 2,
                color: grey
              ),
              bottom: BorderSide(
                width: 2,
                color: grey
              )
            )
          ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                const Text("Reward Notifications", style: TextStyle(fontSize: 18),),
                GestureDetector(
                  onTap: () => setState(() {
                    rewardNotifications = !rewardNotifications;
                  }),
                  child: const CustomSwitch()
                )
              ],
            ),
          ),
      ]
    );
  }
}