import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:storage_robot/screens/colour_screen.dart';
import 'package:storage_robot/screens/distance_screen.dart';
import 'package:storage_robot/screens/employees_screen.dart';
import './themes/theme_provider.dart';

import './firebase_options.dart';

// Screens
import './screens/home_screen.dart';
import './auth/auth.dart';
import './auth/login_or_register.dart';
import './screens/control_screen.dart';
import './screens/history_screen.dart';
import './screens/settings_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Robo Control',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      initialRoute: AuthScreen.screenId,
      routes: {
        AuthScreen.screenId: (context) => const AuthScreen(),
        LoginOrRegister.screenId: (context) => const LoginOrRegister(),
        HomeScreen.screenId: (context) => HomeScreen(),
        ControlScreen.screenId: (context) => ControlScreen(),
        HistoryScreen.screenId: (context) => HistoryScreen(),
        SettingsScreen.screenId: (context) => const SettingsScreen(),
        EmployeesScreen.screenId: (context) => const EmployeesScreen(),
        DistanceScreen.screenId: (context) => DistanceScreen(),
        ColourScreen.screenId: (context) => ColourScreen(),
      },
    );
  }
}
