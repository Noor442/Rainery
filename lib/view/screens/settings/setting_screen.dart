import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:rainery/view-model/theme_provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Consumer<ThemeProvider>(
            builder: (context, themeNotifier, child) => Switch(
              value: themeNotifier.isDark,
              onChanged: (value) => themeNotifier.switchTheme(),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                await Geolocator.checkPermission();
                Position position = await Geolocator.getCurrentPosition(
                    desiredAccuracy: LocationAccuracy.low);
              },
              child: Text("data")),
        ],
      ),
    );
  }
}
