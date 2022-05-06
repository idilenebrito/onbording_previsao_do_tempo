import 'package:animacoes_explicitas/provider/theme_provider.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: SizedBox(
        width: 75,
        height: 60,
        child: DayNightSwitcher(
          isDarkModeEnabled: themeProvider.isDarkMode,
          onStateChanged: (isDarkModeEnabled) {
            final provider = Provider.of<ThemeProvider>(context, listen: false);
            provider.toggleTheme(isDarkModeEnabled);
          },
        ),
      ),
    );
  }
}
