import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourkuy/pages/splash_screen/page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tourkuy/utils/firebase/firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  DefaultFirebaseOptions firebaseOptions = DefaultFirebaseOptions();
  await Firebase.initializeApp(
    options: firebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: const Scaffold(body: SlashScreenPage()),
    );
  }
}
