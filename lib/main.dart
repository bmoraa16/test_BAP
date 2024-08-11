import 'package:flutter/material.dart';
import 'package:test_bap/models/app_config.dart';
import 'package:test_bap/services/service_locator.dart';
import 'package:test_bap/ui/home/home.dart';

void main() {
  const appConfig = AppConfig(
    appName: 'Test_tecnico_DEV',
    apiUrl: 'https://pokeapi.co/api/v2',
  );
  ServiceLocator.setupServiceLocator(appConfig);
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator.getIt<AppConfig>();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
