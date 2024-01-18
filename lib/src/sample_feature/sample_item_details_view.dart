import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:language_detect_app/src/settings/settings_controller.dart';

/// Displays detailed information about a SampleItem.
class SampleItemDetailsView extends StatelessWidget {
  const SampleItemDetailsView({super.key, this.settingsController});
  static const routeName = '/sample_item';
  final SettingsController? settingsController;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
        actions: [
          IconButton(
              onPressed: () {
                settingsController!.updateThemeMode(
                    settingsController!.themeMode == ThemeMode.dark
                        ? ThemeMode.light
                        : ThemeMode.dark);
              },
              icon: Icon(settingsController!.themeMode == ThemeMode.dark
                  ? Icons.dark_mode_outlined
                  : Icons.sunny))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Hero(
              tag: "img $args",
              child: CachedNetworkImage(
                color: settingsController?.themeMode == ThemeMode.dark
                    ? Colors.black
                    : null,
                colorBlendMode: settingsController?.themeMode == ThemeMode.dark
                    ? BlendMode.color
                    : null,
                imageUrl:
                    "https://ipfs.io/ipfs/bafkreigj6dpfgvyk2eiok7zflkmrbquqryalrh2eeqpkugo6eognv4y33i",
              ),
            ),
            Text('More Information Here ${settingsController?.themeMode}'),
          ],
        ),
      ),
    );
  }
}
