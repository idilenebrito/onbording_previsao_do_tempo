import 'package:animacoes_explicitas/provider/theme_provider.dart';
import 'package:animacoes_explicitas/resources/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/onborading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Previsão do Tempo',
            themeMode: themeProvider.themeMode,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            home: const Onboarding(),
          );
        },
      );
}
  