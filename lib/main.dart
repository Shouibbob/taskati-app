import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskaty_app/core/model/task_model.dart';
import 'package:taskaty_app/core/services/local_storage.dart';
import 'package:taskaty_app/core/utils/themes.dart';
import 'package:taskaty_app/feature/intro/splash_view.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox('userBox');
  await Hive.openBox<TaskModel>('tasksBox');
  AppLocalStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AppLocalStorage.userBox.listenable(),
      builder: (context, userBox, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // toggle between light and dark mode
          themeMode: userBox.get(AppLocalStorage.kIsDarkMode)
              ? ThemeMode.dark
              : ThemeMode.light,
          darkTheme: AppTheme.darkTheme,
          theme: AppTheme.lightTheme,
          home: const SplashView(),
        );
      },
    );
  }
}
