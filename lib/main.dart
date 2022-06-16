import 'package:coctails/common/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/main_screen/main_screen_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => ThemeProvider()),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          themeMode: themeProvider.themeMode,
          theme: ThemeData(
              appBarTheme: const AppBarTheme(backgroundColor: Colors.white54)),
          darkTheme: ThemeData.dark(),
          home: MainScreenPage(),
        );
      },
    );
  }
}
