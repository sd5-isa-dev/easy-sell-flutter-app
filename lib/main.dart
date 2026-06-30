import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/navigation/auth_router.dart';
import 'core/services/firebase_service.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    if (e.toString().contains('duplicate-app')) {
      print('Firebase already initialized, continuing...');
    } else {
      rethrow;
    }
  }

  await FirebaseService.initialize();

  // Updated to launch your newly named app class
  runApp(const ProviderScope(child: AmougdoulStockApp()));
}

// Renamed the class to match your new brand
class AmougdoulStockApp extends StatelessWidget {
  const AmougdoulStockApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Wrapped your router in a MaterialApp to set the title
    return const MaterialApp(
      title: 'Amougdoul Stock',
      home: AuthRouter(),
    );
  }
}