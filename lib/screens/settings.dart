import 'package:flutter/material.dart';
import 'package:flutter_book_app/theme.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ayarlar'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Tema',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(width: 10),
                Transform.scale(
                  scale: 1.5,
                  child: Consumer<ThemeNotifier>(
                    builder: (context, notifier, child) => Switch(
                      activeThumbImage:
                          const AssetImage("assets/images/sun.png"),
                      activeColor: Colors.white,
                      activeTrackColor: Colors.orange.shade100,
                      inactiveThumbColor: Colors.black,
                      inactiveThumbImage:
                          const AssetImage("assets/images/moon1.png"),
                      value: notifier.lightTheme,
                      onChanged: (state) {
                        notifier.toggleTheme();
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Dil'),
                // Switch(
                //     value: _light,
                //     onChanged: (state) {
                //       setState(() {
                //         _light = state;
                //       });
                //     }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
